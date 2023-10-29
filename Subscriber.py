import numpy as np 
import matplotlib.pyplot as plt 
from matplotlib.patches import Rectangle 
import random


class Point :
    def __init__(self,x,y) :
        self.x = x
        self.y = y
    def getIndex(self,size) :
        return self.x * size + self.y
    
class Platform :
    def __init__(self,size,startPoint,endPoint) :
        self.size = size
        self.platform = np.arange(size * size,dtype=np.uint8)
        self.platform.fill(0)
        self.startPoint = startPoint
        self.endPoint = endPoint

    def setItem(self,x,y,data) :
        self.platform[x * size + y] = data

    def getItem(self,x,y) :
        return self.platform[x * size + y]

    def initPlatform(self,countOfBlock) :
        size2 = self.size * self.size
        for i in range(countOfBlock) :
            randValue = random.randint(0,size2 - 1)
            if self.startPoint.getIndex(self.size) != randValue and self.endPoint.getIndex(self.size) != randValue :
                self.platform[randValue] = 1

    def drawPlatform(self) :
        for i in range(self.size) :
            for j in range(self.size) :
                if self.getItem(i,j) == 1 :
                    drawRectangle(i,j,'black')
                else :
                    drawRectangle(i,j,"white")
        drawRectangle(self.startPoint.x,self.startPoint.y,'red')

size = 9
interval = 1
fig = plt.figure(figsize=(5,5))
ax = fig.add_subplot(111)
ax.grid()
ax.set_xlim([0, size])
ax.set_ylim([0, size])


def drawRectangle(x,y,color) : 
    ax.add_patch(Rectangle((x, y), interval, interval, fc = color, lw = 1))

platform = Platform(size,Point(0,0),Point(size - 1 ,size - 1))
platform.initPlatform(10)
platform.drawPlatform()

plt.show() 

