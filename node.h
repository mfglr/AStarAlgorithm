#ifndef CUSTOM_Node_h
#define CUSTOM_Node_h
#include "vector2d.h"
#include <math.h>
#include "platform.h"
namespace AStarAlgorithm{
    class Node{
        private :
            Vector2D *location;
            int g;
            // l1 norm for heuristic function;
            int h(Vector2D *destination){
                return abs(destination->getX() - location->getX()) + abs(destination->getY() - location->getY());
            }
        public :
            Node(Vector2D *location, int g){ this->location = location; this->g = g; }
            Vector2D *getLocation(){ return location;} 
            int f(Vector2D *destination){ return h(destination) + g; }
            Node *createNextNode(Vector2D *move){ return new Node(*move + *location,g + 1); }
            Node *clone(){ return new Node(location->clone(),g); }
            void visit(Platform *platform){  platform->visit(location); }
    };
}
#endif