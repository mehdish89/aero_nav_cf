#!/usr/bin/env python

import rospy

if __name__ == "__main__":
    rospy.init_node("getparam", anonymous = True)


    while not rospy.is_shutdown():
    	param_name = rospy.search_param('/dynamicparam')
    	param = rospy.get_param(param_name)

    	# print(param['dynamicparam_17478_1466016346820']['XY_ki'])

    	# rospy.logerr(param['XY_ki'])

    # rospy.spin()
