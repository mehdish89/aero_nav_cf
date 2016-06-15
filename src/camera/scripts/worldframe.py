#!/usr/bin/env python  
""" 
    YIFANG [iphone] AND MEHDI [ Mitch] 2016 
"""


import roslib
import rospy
import math
import tf
import nav_msgs.msg
import numpy as np
from numpy.linalg import inv

from geometry_msgs.msg import (
    PoseArray,
    PoseStamped,
    Pose,
    Point,
    Quaternion,
    Twist,
)
from apriltags_ros.msg import (AprilTagDetection,AprilTagDetectionArray)
from sensor_msgs.msg import Imu


class Kalman(object):
    """ Kalman Filter """

    def __init__(self, F, B, Q, H, R):
        self.F = F
        self.B = B
        self.Q = np.array(Q)
        self.H = np.array(H)
        self.R = np.array(R)

    def dot(self,a,b,c):
        return np.dot(a,np.dot(b,c))

    def predict(self,x,P,u,dt):

        dot = self.dot
        F = self.F
        B = self.B
        Q = self.Q

        x_new = np.dot(F(dt),x) + np.dot(B(dt),u)
        P_new = np.dot(np.dot(F(dt),P),F(dt).T) + Q
        return x_new, P_new


    def update(self,x,P,z):
        
        dot = self.dot
        R = self.R
        H = self.H

        K = dot(P, H.T, inv(dot(H,P,H.T) + R))
        x_new = x + np.dot(K,z-np.dot(H,x))
        P_new = P - dot(K,H,P)
        return x_new, P_new



kf = Kalman(

        lambda dt: np.array([[ 1, 0, 0, dt,  0, 0  ],
                             [ 0, 1, 0,  0, dt, 0  ],
                             [ 0, 0, 1,  0,  0, dt ],
                             [ 0, 0, 0,  1,  0, 0  ],
                             [ 0, 0, 0,  0,  1, 0  ],
                             [ 0, 0, 0,  0,  0, 1  ]]),
        
        lambda dt: np.array([[ 0,  0,  0 ],
                             [ 0,  0,  0 ],
                             [ 0,  0,  0 ],
                             [ dt, 0,  0 ],
                             [ 0,  dt, 0 ],
                             [ 0,  0,  dt]]),
        
        np.array([[.5,  0,  0,  0,  0,  0  ],
                  [ 0, .5,  0,  0,  0,  0  ],
                  [ 0,  0, .5,  0,  0,  0  ],
                  [ 0,  0,  0,.05,  0,  0  ],
                  [ 0,  0,  0,  0,.05,  0  ],
                  [ 0,  0,  0,  0,  0, .05 ]]),

        np.array([[ 1,  0,  0,  0,  0,  0  ],
                  [ 0,  1,  0,  0,  0,  0  ],
                  [ 0,  0,  1,  0,  0,  0  ],
                  [ 0,  0,  0,  1,  0,  0  ],
                  [ 0,  0,  0,  0,  1,  0  ],
                  [ 0,  0,  0,  0,  0,  1 ]]),


        np.array([[ .03, 0,  0,   0,   0,  0  ],
                  [ 0, .03,  0,   0,   0,  0  ],
                  [ 0,  0, .03,   0,   0,  0  ],
                  [ 0,  0,  0, .005,   0,  0  ],
                  [ 0,  0,  0,   0, .005,  0  ],
                  [ 0,  0,  0,   0,   0, .005 ]]),
)

x = 0
y = 0
z = 0

roll = 0
pitch = 0
yaw = 0

lx = 0
ly = 0
lz = 0
lt = 0

lvx = 0
lvy = 0
lvz = 0

ltt = 0

X = np.zeros((6,1))
P = np.zeros((6,6))


yaw_diff = 0
imu_yaw = 0

def pub_base_link(msg, name):
    
    global x
    global y
    global z
    global lx, ly, lz, lt

    global yaw_diff, imu_yaw

    global yaw


    x = msg.pose.position.x
    y = msg.pose.position.y
    z = msg.pose.position.z
    
    x1 = msg.pose.orientation.x
    y1 = msg.pose.orientation.y
    z1 = msg.pose.orientation.z
    w = msg.pose.orientation.w
    (roll, pitch, yaw) = tf.transformations.euler_from_quaternion([x1,y1,z1,w])


    dt = msg.header.stamp.to_sec() - lt

    if(dt==0):
        return

    alpha = 0.7

    yaw_diff = yaw_diff * alpha + (yaw - imu_yaw) * (1 - alpha)
    

    # rospy.logerr("yaw: {0}  imu_yaw: {1}  yaw_diff: {2}".format(yaw, imu_yaw, yaw_diff))

    dx = x - lx
    dy = y - ly
    dz = z - lz


    lx = x
    ly = y
    lz = z
    lt = msg.header.stamp.to_sec()

    # rospy.logerr(dt)
    
    vx = dx/dt
    vy = dy/dt
    vz = dz/dt

    alpha = 0.5

    global lvx, lvy, lvz

    vx = lvx * alpha + vx * (1 - alpha)
    vy = lvy * alpha + vy * (1 - alpha)
    vz = lvz * alpha + vz * (1 - alpha)
    

    

    lvx = vx
    lvy = vy
    lvz = vz

    global X, P
    Z = np.array([x, y, z, vx, vy, vz]).reshape(6,1)
    # rospy.logerr(Z)
    X, P = kf.update(X, P, Z)
    # rospy.logerr(X)


# get roll pitch yaw from crazyflie
def callback_stab(msg):
    global roll, pitch
    global yaw_diff
    
    roll = msg.pose.position.x*math.pi/180.0
    pitch = -msg.pose.position.y*math.pi/180.0
    imu_yaw = msg.pose.position.z*math.pi/180.0
    global yaw
    # yaw = (imu_yaw + yaw_diff)%(2*math.pi)

    
    # roll = msg.linear_acceleration.x*math.pi/180.0
    # pitch = -msg.linear_acceleration.y*math.pi/180.0
    # imu_yaw = msg.linear_acceleration.z*math.pi/180.0



# imu callback
def callback1(msg): 
    
    # global gyro_x,gyro_y,gyro_z
    global roll, pitch, yaw
    global X, P
    global ltt

    stamp = msg.header.stamp
    t = stamp.to_sec()
    dt = t - ltt
    
    if(ltt == 0):
        dt = 0

    ltt = t

    gyro_x = msg.angular_velocity.x
    gyro_y = msg.angular_velocity.y
    gyro_z = msg.angular_velocity.z

    ax = -msg.linear_acceleration.x
    ay = -msg.linear_acceleration.y
    az = -msg.linear_acceleration.z

    global bl

    msg = PoseStamped()
    msg.header.frame_id = '/crazyflie/base_link'    
    # msg.header.stamp = bl.getLatestCommonTime("/world", "/crazyflie/base_link")
    #msg.header.stamp = stamp
    
    C = 10.**6


    msg.pose.position.x = ax * C
    msg.pose.position.y = ay * C
    msg.pose.position.z = az * C


    try:        
        msg = bl.transformPose('world', msg)
    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException, Exception) as e:
        rospy.logerr("error({0}):".format(e))
        #return 
    # rospy.logerr('Here===================================================================================')
    ax = msg.pose.position.x / C
    ay = msg.pose.position.y / C
    az = msg.pose.position.z * 0 / C
    # az = msg.pose.position.z / C

    # rospy.logerr(ax)
    # rospy.logerr(ay)
    # rospy.logerr(ay)
    if ax < 0.3 and ax>-0.3:
        ax = 0
    if ay < 0.3 and ay>-0.3:
        ay = 0
    # if az < 0.3:
    #     az = 0
    acc_world = Imu()
    acc_world.header.stamp = stamp
    acc_world.linear_acceleration.x = ax
    acc_world.linear_acceleration.y = ay
    acc_world.linear_acceleration.z = az
    pub_acc.publish(acc_world)

    # rospy.logerr("ESTIMATED  ax:{0:3f}  ay:{1:3f}  az:{2:3f}".format(ax,ay,az))    
    
    U = np.array([ax,ay,az]).reshape(3,1)
    X, P = kf.predict(X,P,U,dt)
    # rospy.logerr('Here')
    # rospy.logerr(X)
    x = X[0][0]
    y = X[1][0]
    z = X[2][0]


    (px,py,pz,pw) = tf.transformations.quaternion_from_euler(roll, pitch, yaw)
    


    # pub = rospy.Publisher('/crazyflie/pid', geometry_msgs,PoseStamped,queue_size = 1)

    
    

    br = tf.TransformBroadcaster()
    # br.sendTransform((x,y,z),
    br.sendTransform((x,y,z),
                     (px,py,pz,pw),
                     stamp,
                     '/crazyflie/base_link',
                     '/world')
    
    # rospy.logerr("ESTIMATED  x:{0:3f}  y:{1:3f}  z:{2:3f}".format(ex,ey,ez))
    # rospy.logerr("ESTIMATED vx:{0:3f} vy:{1:3f} vz:{2:3f}".format(evx,evy,evz))

    msg = Twist()
    msg.linear.x = X[3][0]
    msg.linear.y = X[4][0]
    msg.linear.z = X[5][0]
    msg.angular.x = gyro_x
    msg.angular.y = gyro_y
    msg.angular.z = gyro_z

    global vel
    vel.publish(msg)

    global odom
    
    p = nav_msgs.msg.Odometry()
    p.header.seq = 0
    p.header.stamp = stamp
    p.header.frame_id = 'world'
    p.pose.pose.position.x = X[0][0]#x
    p.pose.pose.position.y = X[1][0]#y
    p.pose.pose.position.z = X[2][0]#z

    p.pose.pose.orientation.x = px
    p.pose.pose.orientation.y = py
    p.pose.pose.orientation.z = pz
    p.pose.pose.orientation.w = pw

    p.twist.twist.linear.x = X[3][0]
    p.twist.twist.linear.y = X[4][0]
    p.twist.twist.linear.z = X[5][0]

    odom.publish(p)

    p = PoseStamped()
    p.header.seq = 0
    p.header.stamp = stamp
    p.header.frame_id = 'world'
    p.pose.position.x = X[0][0]#x
    p.pose.position.y = X[1][0]#y
    p.pose.position.z = X[2][0]#z

    p.pose.orientation.x = px
    p.pose.orientation.y = py
    p.pose.orientation.z = pz
    p.pose.orientation.w = pw

    global pub
    pub.publish(p)
    

    

    


if __name__ == '__main__':
    rospy.init_node('pose_in_worldframe')
    # rospy.Subscriber('/tag_detections',  AprilTagDetectionArray, handle_tag_pose, '/tag_detections')
    rospy.Subscriber('/geometry_msgs/Pose', PoseStamped, pub_base_link, '/crazyflie/base_link')
    rospy.Subscriber('crazyflie/stabilizer',PoseStamped, callback_stab)
    rospy.Subscriber('/crazyflie/imu',Imu,callback1)
    # rospy.Subscriber('/geometry_msgs/Pose',PoseStamped,callback2,'/crazyflie/base_link')
    # pub = rospy.Publisher('/crazyflie/base_link', Quaternion,queue_size = 1)
    # rospy.loginfo('before')
    bl = tf.TransformListener()
    try:
        vel = rospy.Publisher('/geometry_msgs/Twist', Twist, queue_size=10) # velocity
        odom = rospy.Publisher('/crazyflie/odom', nav_msgs.msg.Odometry, queue_size = 1)
        pub = rospy.Publisher('/crazyflie/pid', PoseStamped, queue_size = 1)
        pub_acc = rospy.Publisher('/world_acc',Imu,queue_size = 1)
    except Exception as e:
        rospy.logerr("error({0}):".format(e))
    rospy.spin()
