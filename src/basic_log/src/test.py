#!/usr/bin/env python
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

#"""
#Simple example that connects to the first Crazyflie found, ramps up/down
#the motors and disconnects.
#"""

import rospy
import time
import sys
from threading import Thread
import logging

#sys.path.append("./lib")
import cflib  # noqa
from cflib.crazyflie import Crazyflie  # noqa

logging.basicConfig(level=logging.ERROR)


def Connect(object):

    #def __init__(self,link_uri):

    cf = Crazyflie()

        #self._cf.connected.add_callback(self._connected)
        #self._cf.disconnected.add_callback(self._disconnected)
        #self._cf.connection_failed.add_callback(self._connection_failed)
        #self._cf.connection_lost.add_callback(self._connection_lost)

    cf.open_link(link_uri)

    print("Connecting to %s" % link_uri)

class MotorRampExample:
    def __init__(self,link_uri):

        self._cf = Crazyflie()

        self._cf.connected.add_callback(self._connected)
        #self._cf.connected.add_callback(self._ramp_motors)
        self._cf.disconnected.add_callback(self._disconnected)
        self._cf.connection_failed.add_callback(self._connection_failed)
        self._cf.connection_lost.add_callback(self._disconnected)
        #self._cf.ramp_motors.add_callback(self._ramp_motors)

        #self._cf.open_link(link_uri)
        #print("Connecting to %s" % link_uri)

        # if (self.is_connected != True):
        # 	self._cf.open_link(link_uri)
	       #  self.is_connected = True

	       #  print("Connecting to %s" % link_uri)

    def _connected(self,link_uri):
       # """ This callback is called form the Crazyflie API when a Crazyflie
       # has been connected and the TOCs have been downloaded."""

        # Start a separate thread to do the motor test.
        # Do not hijack the calling thread!
        Thread(target=self._ramp_motors).start()
        print 'I am in _connected'
       
    def _connection_failed(self,link_uri, msg):
       # """Callback when connection initial connection fails (i.e no Crazyflie
       # at the specified address)"""
        print("Connection to %s failed: %s" % (link_uri, msg))

    def _connection_lost(self, msg):
       # """Callback when disconnected after a connection has been made (i.e
       # Crazyflie moves out of range)"""
        print("Connection to %s lost: %s" % (link_uri, msg))

    def _disconnected(self, link_uri):
       # """Callback when the Crazyflie is disconnected (called in all cases)"""
        print("Disconnected from %s" % link_uri)

    def _closelink(self, link_uri):
    	self._cf.close_link() 

    def _ramp_motors(self):
        thrust_mult = 1
        thrust_step = 500
        thrust = 20000
        pitch = 0
        roll = 0
        yawrate = 0 
        print ('I am in ramp_motors')

        # Unlock startup thrust protection
        self._cf.commander.send_setpoint(0, 0, 0, 0)
        self._cf.commander.send_setpoint(roll, pitch, yawrate, thrust)

        # while thrust >= 20000:
        #     self._cf.commander.send_setpoint(roll, pitch, yawrate, thrust)
        #     time.sleep(0.1)
        #     if thrust >= 25000:
        #         thrust_mult = -1
        #     thrust += thrust_step * thrust_mult
        self._cf.commander.send_setpoint(0, 0, 0, 0)
        # Make sure that the last packet leaves before the link is closed
        # since the message queue is not flushed before closing
        time.sleep(0.1)
        # self._cf.close_link()


def ramp_motors(link_uri):
        crazy = Crazyflie()
        print 'I am here motors'
        thrust_mult = 1
        thrust_step = 500
        thrust = 30000
        pitch = 0
        roll = 0
        yawrate = 0 

        # Unlock startup thrust protection
        crazy.commander.send_setpoint(0, 0, 0, 0)
        crazy.commander.send_setpoint(roll, pitch, yawrate, thrust)

        # while thrust >= 20000:
        #     crazy.commander.send_setpoint(roll, pitch, yawrate, thrust)
        #     #print 'send command'
        #     time.sleep(0.1)
        #     if thrust >= 25000:
        #         thrust_mult = -1
        #     thrust += thrust_step * thrust_mult
        crazy.commander.send_setpoint(0, 0, 0, 0)
        # Make sure that the last packet leaves before the link is closed
        # since the message queue is not flushed before closing
        time.sleep(0.1)
        # crazy.close_link()


def choose(items, title_text, question_text):
    """
    Interactively choose one of the items.
    """
    print(title_text)

    for i, item in enumerate(items, start=1):
        print('%d) %s' % (i, item))
    print('%d) Abort' % (i + 1))

    selected = input(question_text)
    #selected = 1
    try:
        index = int(selected)
    except ValueError:
        index = -1
    if not (index - 1) in range(len(items)):
        print('Aborting.')
        return None

    return items[index - 1]


def scan():

    # Initiate the low level drivers
    cflib.crtp.init_drivers(enable_debug_driver=False)

    # Scan for Crazyflies
    print('Scanning interfaces for Crazyflies...')
    available = cflib.crtp.scan_interfaces()
    interfaces = [uri for uri, _ in available]

    if not interfaces:
        return None
    return choose(interfaces, 'Crazyflies found:', 'Select interface: ')


if __name__ == '__main__':

    rospy.init_node('crazyflie')
    link_uri = "radio://0/10/250K"
    #link_uri = scan()
    #Connect(link_uri)
    node = MotorRampExample(link_uri)
    while not rospy.is_shutdown():
    	#node = MotorRampExample(link_uri)
		node._ramp_motors()
		#ramp_motors(link_uri)
		rospy.sleep(0.01)
	#node._closelink(link_uri)
