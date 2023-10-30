#!/usr/bin/env_python
import rospy
from vector2d import Vector2D
from custom_platform import Platform
from a_star_algorithm.msg import platformMessage


def createPlatformMessage(size,countOfBlocks,start,end) :
    platform = Platform(size,start,end)
    platform.initPlatform(countOfBlocks)
    msg = platformMessage()
    msg.size = size
    msg.data = platform.data
    msg.start = start
    msg.end = end


if __name__ == "__main__" :


    size = 9
    msg = createPlatformMessage(size,25,Vector2D(0,0),Vector2D(size-1,size-1))

    rospy.init_node("platformProvider",anonymous = True)
    pub = rospy.Publisher("platform",platformMessage)
    rospy.loginfo(msg)
    pub.publish(msg)