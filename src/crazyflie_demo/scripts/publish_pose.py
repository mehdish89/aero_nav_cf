#!/usr/bin/env python

import rospy
import tf
# import tf.TransformerROS
from geometry_msgs.msg import PoseStamped

if __name__ == '__main__':
    rospy.init_node('publish_pose', anonymous=True)

    bl = tf.TransformListener()
    br = tf.TransformBroadcaster()

    worldFrame = rospy.get_param("~worldFrame", "/world")
    # worldFrame = rospy.get_param("~worldFrame", "/tag_1")
    name = rospy.get_param("~name") # name = pose
    # print 'publish_pose name = ', name
    r = rospy.get_param("~rate")
    x = rospy.get_param("~x")
    y = rospy.get_param("~y")
    z = rospy.get_param("~z")

    rate = rospy.Rate(r)

    msg = PoseStamped()
    msg.header.frame_id = 'goal'

    # msg = transformPose('world', msg)

    msg.header.seq = 0
    msg.header.stamp = rospy.Time.now()
    msg.header.frame_id = worldFrame
    msg.pose.position.x = x
    msg.pose.position.y = y
    msg.pose.position.z = z
    quaternion = tf.transformations.quaternion_from_euler(0, 0, 0)
    msg.pose.orientation.x = quaternion[0]
    msg.pose.orientation.y = quaternion[1]
    msg.pose.orientation.z = quaternion[2]
    msg.pose.orientation.w = quaternion[3]

    pub = rospy.Publisher(name, PoseStamped, queue_size=1)
    # pub1 = rospy.Publisher('/move_base_simple/goal', PoseStamped, queue_size=1)

    while not rospy.is_shutdown():
        # msg = PoseStamped()
        msg.header.frame_id = 'world'    
        # try:
        #     # msg = bl.transformPose('world', msg)

        # except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException, Exception) as e:
        #     rospy.logerr("error({0}):".format(e))
        #     continue
        # rospy.loginfo('GOT HERE')
        msg.header.seq += 1  
        msg.header.stamp = rospy.Time.now()
        # print('publish')
        
        pub.publish(msg)
        rate.sleep()
