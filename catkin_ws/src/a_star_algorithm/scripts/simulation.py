#!/usr/bin/env python3
import rospy;
import matplotlib.pyplot as plt 
from matplotlib.patches import Rectangle
from a_star_algorithm.msg import PlatformMessage
from a_star_algorithm.msg import PathMessage
from a_star_algorithm.msg import NodeMessage
from a_star_algorithm.msg import AlgorithmMessage
import matplotlib.animation as animation

import os



# interval = 1
# currentPlatformId = -1
# fig = plt.figure(figsize=(5,5))
# ax = fig.add_subplot(111)
# ax.grid()
# ax.set_xlim([0, 9])
# ax.set_ylim([0, 9])

# def drawRectangle(x,y,color) : 
#     ax.add_patch(Rectangle((x, y), interval, interval, fc = color, lw = 1))

# def drawPlatform(msg) :
#     for i in range(msg.size) : 
#         for j in range(msg.size) :
#             if msg.data[i * msg.size + j] == 1 :
#                 drawRectangle(i,j,"black")
#             else :
#                 drawRectangle(i,j,"white")
#     drawRectangle(msg.start.x,msg.start.y,"red")
#     drawRectangle(msg.end.x,msg.end.y,"blue")

# def drawPath(path,color) :
#     for i in range(path.sizeOfNodes) :
#         location = path.nodes[i].location
#         drawRectangle(location.x,location.y,color)

# def draw(msg):
#     drawPlatform(msg.platform)
#     drawPath(msg.activePath,"green")


if __name__ == "__main__" :
    rospy.init_node("simulation",anonymous = True)
    path_sub = rospy.Subscriber("algorithm",AlgorithmMessage,getAlgorithmMessage)

    plt.show()

    rospy.spin()
    
