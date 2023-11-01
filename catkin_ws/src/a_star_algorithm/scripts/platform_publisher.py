#!/usr/bin/env python3
import rospy
import numpy as np
from custom_platform import Platform
from vector2d import Vector2D
from a_star_algorithm.msg import PlatformMessage

def createPlatformMessage(size,countOfBlocks,start,end) :
    msg = PlatformMessage()
    obje = Platform(size,start,end)
    obje.initPlatform(countOfBlocks)
    msg.size = size
    msg.data = obje.data
    msg.start = np.array([start.x,start.y])
    msg.end = np.array([end.x,end.y])
    return msg

if __name__ == "__main__" :
    
    pub = rospy.Publisher("platform",PlatformMessage,queue_size=10)
    rospy.init_node("platformProvider",anonymous = True)
    rate = rospy.Rate(1)
    
    size = 9    
    msg = createPlatformMessage(size,25,Vector2D(0,0),Vector2D(size-1,size-1))
    while not rospy.is_shutdown() :
        rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()