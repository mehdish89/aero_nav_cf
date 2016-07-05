#!/usr/bin/env python

import rospy

from dynamic_reconfigure.server import Server
from dynarecon.cfg import dyna_paramConfig

def callback(config, level):
    rospy.loginfo("""Reconfigure Request: {XY_kp},{XY_kd},{XY_ki},\ 
          {Z_kp},{Z_kd},{Z_ki},{Thrust}""".format(**config))
    
    rospy.set_param('/crazyflie/controller/PIDs/Xp/kp', config['XY_kp'])
    rospy.set_param('/crazyflie/controller/PIDs/Xp/kd', config['XY_kd'])
    rospy.set_param('/crazyflie/controller/PIDs/Xp/ki', config['XY_ki'])

    rospy.set_param('/crazyflie/controller/PIDs/Yp/kp', config['XY_kp'])
    rospy.set_param('/crazyflie/controller/PIDs/Yp/kd', config['XY_kd'])
    rospy.set_param('/crazyflie/controller/PIDs/Yp/ki', config['XY_ki'])

    rospy.set_param('/crazyflie/controller/PIDs/Z/kp', config['Z_kp'])
    rospy.set_param('/crazyflie/controller/PIDs/Z/kd', config['Z_kd'])
    rospy.set_param('/crazyflie/controller/PIDs/Z/ki', config['Z_ki'])

    rospy.set_param('/crazyflie/controller/thrust', config['Thrust'])
    return config

if __name__ == "__main__":
    rospy.init_node("dynamicparam", anonymous = True)

    srv = Server(dyna_paramConfig, callback)
    rospy.spin()
