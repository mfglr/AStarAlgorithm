class Vector2D :
    def __init__(self,x,y) :
        self.x = x
        self.y = y
    def getIndex(self,size) :
        return self.x * size + self.y