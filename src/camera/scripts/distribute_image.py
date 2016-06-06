#!/usr/bin/env python  
import roslib
import rospy
import math
import tf
import geometry_msgs.msg
import sensor_msgs.msg

global count1, count2
count1 = 1
# count2 = 1
def callback_camera1(msg):
	global count1
	
	cores = 3

	pub = rospy.Publisher('/image1_' + str(count1%cores+1), sensor_msgs.msg.Image, queue_size=10)
	image = sensor_msgs.msg.Image()
	image = msg
	pub.publish(image)
	count1 = count1 + 1



# def callback_camera2(msg):
# 	global count2
	
# 	cores = 3

# 	pub = rospy.Publisher('/image2_' + str(count2%cores+1), sensor_msgs.msg.Image, queue_size=10)
# 	image = sensor_msgs.msg.Image()
# 	image = msg
# 	pub.publish(image)
# 	count2 = count2 + 1

if __name__ == '__main__':
    rospy.init_node('distribute_image')
    rospy.Subscriber('/creative/image_raw', sensor_msgs.msg.Image, callback_camera1)
    # rospy.Subscriber('/usb_cam/image_raw', sensor_msgs.msg.Image, callback_camera2)
    rospy.spin()