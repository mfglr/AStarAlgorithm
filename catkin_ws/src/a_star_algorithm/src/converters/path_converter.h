#ifndef Path_converter_h
#define Path_converter_h

#include "a_star_algorithm/PathMessage.h"
#include "../algorithm/path.h"
#include "../algorithm/node.h"

namespace converters{
    class PathConverter{
        public :
            static a_star_algorithm::PathMessage toMessage(algorithm::Path *path){
                a_star_algorithm::PathMessage msg = a_star_algorithm::PathMessage();
                int sizeOfNodes = path->getSizeOfNodes();
                msg.id = path->getId();
                msg.sizeOfNodes = sizeOfNodes;
                for(int i = 0; i < sizeOfNodes; i++){
                    algorithm::Node node = path->getNode(i);
                    msg.path.push_back(node.getLocation()->getX());
                    msg.path.push_back(node.getLocation()->getY());
                    msg.path.push_back(node.getG());
                }
                return msg;
            }
    };
}
#endif