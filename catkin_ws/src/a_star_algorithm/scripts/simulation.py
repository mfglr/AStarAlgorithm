#!/usr/bin/env python3
import rospy;
import matplotlib.pyplot as plt 
from matplotlib.patches import Rectangle
from a_star_algorithm.msg import PlatformMessage
from a_star_algorithm.msg import PathMessage

interval = 1
currentPlatformId = -1
fig = plt.figure(figsize=(5,5))
ax = fig.add_subplot(111)
ax.grid()
ax.set_xlim([0, 9])
ax.set_ylim([0, 9])


def getPlatformMessage(msg) :
    global currentPlatformId
    if currentPlatformId != msg.id :
        rospy.loginfo(msg)
        currentPlatformId = msg.id
        drawPlatform(msg)


def drawRectangle(x,y,color) : 
    ax.add_patch(Rectangle((x, y), interval, interval, fc = color, lw = 1))

def drawPlatform(msg) :
    for i in range(msg.size) : 
        for j in range(msg.size) :
            if msg.data[i * msg.size + j] == 1 :
                drawRectangle(i,j,"black")
            else :
                drawRectangle(i,j,"white")
    drawRectangle(msg.start[0],msg.start[1],"red")
    drawRectangle(msg.end[0],msg.end[1],"blue")

def drawPath(msg) :
    for i in range(msg.sizeOfNodes) :
        drawRectangle(msg.path[i * 3],msg.path[i * 3 + 1],"yellow")

def getPathMessage(msg) :
    rospy.loginfo(msg)
    drawPath(msg)

if __name__ == "__main__" :
    
    rospy.init_node("simulation",anonymous = True)
    
    plarform_sub = rospy.Subscriber("platform",PlatformMessage,getPlatformMessage)
    path_sub = rospy.Subscriber("path",PathMessage,getPathMessage)
    plt.show()
    rospy.spin()
    
