import numpy as np 
import random

class Vector2D :
    def __init__(self,x,y) :
        self.x = x
        self.y = y
    def getIndex(self,size) :
        return self.x * size + self.y
    
class Platform :
    def __init__(self,size,start,end) :
        self.size = size
        self.data = np.arange(size * size,dtype=np.int8)
        self.platform.fill(0)
        self.start = start
        self.end = end

    def setItem(self,x,y,item) :
        self.data[x * self.size + y] = item

    def getItem(self,x,y) :
        return self.data[x * self.size + y]

    def initPlatform(self,countOfBlocks) :
        size2 = self.size * self.size
        for i in range(countOfBlocks) :
            randValue = random.randint(0,size2 - 1)
            if self.start.getIndex(self.size) != randValue and self.end.getIndex(self.size) != randValue :
                self.data[randValue] = 1
