import numpy as np 
import random
    
class Platform :
    def __init__(self,size,start,end) :
        self.size = size
        self.data = np.arange(size * size,dtype=np.int32)
        self.data.fill(0)
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
