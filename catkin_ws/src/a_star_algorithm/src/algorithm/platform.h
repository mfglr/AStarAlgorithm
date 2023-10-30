#ifndef Platform_h
#define Platform_h
#include <stdlib.h>
#include "vector2d.h"
namespace AStarAlgorithm{
    class Platform{
        private :
            int size;
            Vector2D *start;
            Vector2D *end;
            char *platform;
            char *visitedNodes;
            
            int getIndex(Vector2D *l){ return size * l->getX() + l->getY(); }
            bool isInRange(Vector2D *l){
                return 0 <= l->getX() && l->getX() < size && 0 <= l->getY() && l->getY() < size;
            }
            int isVisited(Vector2D *l){ return visitedNodes[getIndex(l)]; }
            int isBlock(Vector2D *l){ return platform[getIndex(l)]; }
           
        
        public :
            Vector2D *getEnd(){ return end; }
            Vector2D *getStart(){ return start; }
            bool canItMakeTheMove(Vector2D* location,Vector2D *move){
                Vector2D *newLocation = *location + *move;
                return isInRange(newLocation) && !isBlock(newLocation) && !isVisited(newLocation);
            }
            Platform(int size,Vector2D *start,Vector2D *end,char *platform){
                this->size = size;
                this->start = start;
                this->end = end;
                this->platform = platform;
                visitedNodes = (char *)malloc(sizeof(char) * (size * size));
                for(int i = 0; i < size * size; i++)
                    visitedNodes[i] = 0;
            }
            void visit(Vector2D *l){ visitedNodes[getIndex(l)] = 1; }
            bool canItMove(Vector2D* location){
                for(int i = 0; i < countOfMoves;i++){
                    if(canItMakeTheMove(location,moves + i))
                        return true;
                }
                return false;
            }
            bool IsItAtTheDestination(Vector2D *l){ return *l == *end;}
    };
}
#endif