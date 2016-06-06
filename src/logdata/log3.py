# -*- coding: utf-8 -*-
#
#     ||          ____  _ __
#  +------+      / __ )(_) /_______________ _____  ___
#  | 0xBC |     / __  / / __/ ___/ ___/ __ `/_  / / _ \
#  +------+    / /_/ / / /_/ /__/ /  / /_/ / / /_/  __/
#   ||  ||    /_____/_/\__/\___/_/   \__,_/ /___/\___/
#
#  Copyright (C) 2014 Bitcraze AB
#
#  Crazyflie Nano Quadcopter Client
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.

#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA  02110-1301, USA.

"""
Simple example that connects to the first Crazyflie found, logs the Stabilizer
and prints it to the console. After 10s the application disconnects and exits.
"""

import sys
import logging
import time
from threading import Timer
import tf
import rospy
import geometry_msgs.msg

sys.path.append("../lib")
import cflib.crtp  # noqa
from cfclient.utils.logconfigreader import LogConfig  # noqa
from cfclient.utils.logconfigreader import LogVariable  # noqa
from cflib.crazyflie import Crazyflie  # noqa

# Only output errors from the logging framework
logging.basicConfig(level=logging.ERROR)


class LoggingExample:
    """
    Simple logging example class that logs the Stabilizer from a supplied
    link uri and disconnects after 5s.
    """

    def __init__(self, link_uri):
        """ Initialize and run the example with the specified link_uri """

        # Create a Crazyflie object without specifying any cache dirs
        self._cf = Crazyflie()

        # Connect some callbacks from the Crazyflie API
        self._cf.connected.add_callback(self._connected)
        elf.link_status = "Unknown"
        self.link_quality = 0.0
        self.packetsSinceConnection = 0
        self.motor_status = ""
        self.pitch = 0.0
        self.roll = 0.0
        self.thrust = 0
        self.yaw = 0.0
        self.pub = rospy.Publisher('/crazyflie/base_link',geometry_msgs.msg.PoseStamped,queue_size=1)
        
        # Init the callbacks for the crazyflie lib
        self.crazyflie = Crazyflie()

        # Init the published topics for ROS, for this class
        # self.link_status_pub  = rospy.Publisher('link_status', String, latch=True, queue_size = 10)
        # self.link_quality_pub = rospy.Publisher('link_quality', Float32, queue_size = 10)
        # self.packet_count_pub = rospy.Publisher('packet_count', UInt32, queue_size = 10)

        # self.motor_status_pub = rospy.Publisher('motors', String,queue_size = 10)

        # self.pitch_pub        = rospy.Publisher('stabilizer/pitch', Float32,queue_size = 10)
        # self.roll_pub         = rospy.Publisher('stabilizer/roll', Float32,queue_size = 10)
        # self.thrust_pub       = rospy.Publisher('stabilizer/thrust', Float32,queue_size = 10)
        # self.yaw_pub          = rospy.Publisher('stabilizer/yaw', Float32,queue_size = 10)



    def connected(self, link_uri):
        """ This callback is called form the Crazyflie API when a Crazyflie
        has been connected and the TOCs have been downloaded."""
        print("Connected to %s" % link_uri)

        # The definition of the logconfig can be made before connecting
        self._lg_stab = LogConfig(name="Stabilizer", period_in_ms=10)
        self._lg_stab.add_variable("stabilizer.roll", "float")
        self._lg_stab.add_variable("stabilizer.pitch", "float")
        self._lg_stab.add_variable("stabilizer.yaw", "float")

        # Adding the configuration cannot be done until a Crazyflie is
        # connected, since we need to check that the variables we
        # would like to log are in the TOC.
        try:
            self._cf.log.add_config(self._lg_stab)
            # This callback will receive the data
            self._lg_stab.data_received_cb.add_callback(self._stab_log_data)
            # This callback will be called on errors
            self._lg_stab.error_cb.add_callback(self._stab_log_error)
            # Start the logging
            self._lg_stab.start()
            self.pitch  = data["stabilizer.pitch"]
            self.roll   = data["stabilizer.roll"]
            self.thrust = data["stabilizer.thrust"]
            self.yaw    = data["stabilizer.yaw"]

            (x,y,z,w) = tf.transformations.quaternion_from_euler([self.roll,self.pitch,self.yaw])
            msg = geometry_msgs.msg.PoseStamped()
            msg.header.seq = 0
            msg.header.frame_id = '/crazyflie/base_link'
            msg.pose.orientation.x = x
            msg.pose.orientation.y = y
            msg.pose.orientation.z = z
            msg.pose.orientation.w = w
            self.pub.publish(msg)


        except KeyError as e:
            print("Could not start log configuration,"
                  "{} not found in TOC".format(str(e)))
        except AttributeError:
            print("Could not add Stabilizer log config, bad configuration.")

        # Start a timer to disconnect in 10s
        # t = Timer(5, self._cf.close_link)
        # t.start()
def run():
    rospy.init_node('crazyflie_log3')
    # Initialize the low-level drivers (don't list the debug drivers)
    cflib.crtp.init_drivers(enable_debug_driver=False)
    # Scan for Crazyflies and use the first one found
    uri = rospy.get_param('~uri')
    log_data = LoggingExample(uri)
    rospy.loginfo('parameter: uri',uri)
    while not rospy.is_shutdown():
        log_data.connected()
        rospy.sleep(0.1)
    log_data.shut_down()


if __name__ == '__main__':
    run()
