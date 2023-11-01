#ifndef CUSTOM_Path_h
#define CUSTOM_Path_h
#include "a_star_algorithm/PathMessage.h"
#include "vector.h"
#include "node.h"
#include <iostream>

namespace algorithm{
    class Path{
        private :
            int id;
            int indexOfNodes;
            int sizeOfNodes;
            Node *nodes;
            Node* getNodeByIndex(int i){ return nodes + i; }
            Path(int id,int sizeOfNodes){
                this->id = id;
                this->sizeOfNodes = sizeOfNodes;
                indexOfNodes = 0;
                nodes = (Node *)malloc(sizeof(Node) * sizeOfNodes);
            }
            void addNode(Node * node){ nodes[indexOfNodes++] = *node; }
        public :
            Path(int id,int sizeOfNodes,Node *node){ 
                this->id = id;
                this->sizeOfNodes = sizeOfNodes;
                indexOfNodes = 1;
                nodes = (Node *)malloc(sizeof(Node) * sizeOfNodes);
                nodes[0] = *node;
            }
            Path(a_star_algorithm::PathMessage msg){
                id = msg.id;
                sizeOfNodes = msg.sizeOfNodes;
                nodes = (Node *)malloc(sizeof(Node) * sizeOfNodes);
                for(int i = 0; i < sizeOfNodes;i++)
                    nodes[i] = Node(msg.nodes[i]);
            }
            int f(Vector *location){ return getLastNode()->f(location); }
            bool IsItAtTheDestination(Platform * platform){ return platform->IsItAtTheDestination(getLastNode()->getLocation()); }
            Node *getLastNode(){ return nodes + (indexOfNodes - 1); }
            bool operator==(Path const& other){ return this->id == other.id; }
            Node *createNextNode(Vector *move){ return getLastNode()->createNextNode(move); }
            bool CanItMove(Platform *platform){ return platform->canItMove(getLastNode()->getLocation()); }
            Path cloneAndAddNode(int id,Node *node){
                Path path = Path(id,sizeOfNodes + 1);
                for(int i = 0; i < sizeOfNodes;i++)
                    path.addNode(getNodeByIndex(i)->clone());
                path.addNode(node);
                return path;
            }
            void write(){
                std::cout << "id : " << id << std::endl;
                std::cout << "sizeOfNodes : " << sizeOfNodes << std::endl;
                for(int i = 0; i < sizeOfNodes;i++)
                    nodes[i].write();
            }
            static void writeMessage(a_star_algorithm::PathMessage msg){
                std::cout << "id : " << msg.id << std::endl;
                std::cout << "sizeOfNodes : " << msg.sizeOfNodes << std::endl;
                for(int i = 0; i < msg.sizeOfNodes;i++)
                    std::cout << msg.nodes[i].location.x << " - " << msg.nodes[i].location.y << msg.nodes[i].g << std::endl;
            }
            a_star_algorithm::PathMessage toMessage(){
                a_star_algorithm::PathMessage msg = a_star_algorithm::PathMessage();
                msg.id = id;
                msg.sizeOfNodes = sizeOfNodes;
                for(int i = 0; i < sizeOfNodes; i++)
                    msg.nodes.push_back(nodes[i].toMessage());
                return msg;
            }
    };
}
#endif