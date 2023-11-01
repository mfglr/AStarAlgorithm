#ifndef CUSTOM_Node_h
#define CUSTOM_Node_h
#include <iostream>
#include <math.h>
#include "platform.h"
#include "vector.h"
#include "a_star_algorithm/NodeMessage.h"
namespace algorithm{
    class Node{
        private :
            Vector *location;
            int g;
            //heuristic function : l1 norm;
            int h(Vector *destination){
                return abs(destination->getX() - location->getX()) + abs(destination->getY() - location->getY());
            }
        public :
            Node(Vector *location, int g){ this->location = location; this->g = g; }
            Node(a_star_algorithm::NodeMessage msg){ location = new Vector(msg.location); g = msg.g; }
            Vector *getLocation(){ return location;}
            int getG(){return g;}
            int f(Vector *destination){ return h(destination) + g; }
            Node *createNextNode(Vector *move){ return new Node(*move + *location,g + 1); }
            Node *clone(){ return new Node(location->clone(),g); }
            void visit(Platform *platform){  platform->visit(location); }
            void write(){ std::cout << location->getX() << " - " << location->getY() << " - " << g << std::endl; }
            void writeMessage(a_star_algorithm::NodeMessage msg){
                std::cout << msg.location.x << " - " << msg.location.y << " - " << msg.g << std::endl;
            }
            a_star_algorithm::NodeMessage toMessage(){
                a_star_algorithm::NodeMessage msg = a_star_algorithm::NodeMessage();
                msg.location = location->toMessage();
                msg.g = g;
                return msg;
            }
            
    };
}
#endif