import matplotlib.pyplot as plt 
from matplotlib.patches import Rectangle 
import rospy;
from messages import platformMessage





size = 
interval = 1
fig = plt.figure(figsize=(5,5))
ax = fig.add_subplot(111)
ax.grid()
ax.set_xlim([0, size])
ax.set_ylim([0, size])


def drawRectangle(x,y,color) : 
    ax.add_patch(Rectangle((x, y), interval, interval, fc = color, lw = 1))


plt.show() 




