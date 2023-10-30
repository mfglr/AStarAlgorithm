#!/usr/bin/env_python
import rospy
# from messages import platformMessage
from platform import Platform,Vector2D

def createPlatformMessage(size,countOfBlocks,start,end) :
    msg = platformMessage()
    obje = platform.Platform(size,start,end)
    obje.initPlatform(countOfBlocks)
    msg.size = size
    msg.data = obje.data
    msg.start = start
    msg.end = end
    return msg

if __name__ == "main" :

    p = Vector2D(0,0)
    print(p.x + " " + p.y)

    # size = 9
    # msg = createPlatformMessage(size,25,platform.Vector2D(0,0),platform.Vector2D(size-1,size-1))

    # rospy.init_node("platformProvider",anonymous = True)
    # pub = rospy.Publisher("platform",platform)
    # rospy.loginfo(msg)
    # pub.publish(msg)