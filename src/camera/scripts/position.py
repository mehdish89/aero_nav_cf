#!/usr/bin/env python  
import roslib
import rospy
import math
import tf
import geometry_msgs.msg

#from apriltags_ros.msg import (AprilTagDetection,AprilTagDetectionArray)


if __name__ == '__main__':
    rospy.init_node('tag_position')

    listener = tf.TransformListener()
    br = tf.TransformBroadcaster()

    position = rospy.Publisher('geometry_msgs/Pose', geometry_msgs.msg.PoseStamped, queue_size=10)
    #position = rospy.Publisher('tag_detections_pose', geometry_msgs.msg.PoseArray, queue_size=10)
    rate = rospy.Rate(30.0)
    while not rospy.is_shutdown():
        try:
            (trans,rot) = listener.lookupTransform('tag_1', 'tag_0', rospy.Time())
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue

        #print trans,rot
        #(roll, pitch, yaw) = tf.transformations.euler_from_quaternion([rot[0],rot[1],rot[2],rot[3]])
        #print roll,pitch,yaw
        msg = geometry_msgs.msg.PoseStamped()
        msg.header.seq = 0
        msg.header.stamp = listener.getLatestCommonTime("tag_1", "tag_0")
        msg.header.frame_id = 'tag_1'
        msg.pose.position.x = trans[0]
        msg.pose.position.y = trans[1]
        msg.pose.position.z = trans[2]

        msg.pose.orientation.x = rot[0]
        msg.pose.orientation.y = rot[1]
        msg.pose.orientation.z = rot[2]
        msg.pose.orientation.w = rot[3]
        position.publish(msg)

        try:
            (trans,rot) = listener.lookupTransform('tag_1', 'camera', rospy.Time(0))
            # (trans,rot) = listener.lookupTransform('tag_1', 'usb_cam', rospy.Time(0))
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue
        
        br.sendTransform(trans,\
                rot,\
                rospy.Time.now(),\
                'camera', \
                "world")



        rate.sleep()
