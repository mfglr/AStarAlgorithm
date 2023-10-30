#ifndef CUSTOM_Path_h
#define CUSTOM_Path_h

#include <iostream>
#include "node.h"
namespace AStarAlgorithm{
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
            int f(Vector2D *location){ return getLastNode()->f(location); }
            bool IsItAtTheDestination(Platform * platform){ return platform->IsItAtTheDestination(getLastNode()->getLocation()); }
            Node *getLastNode(){ return nodes + (indexOfNodes - 1); }
            bool operator==(Path const& other){ return this->id == other.id; }
            Node *createNextNode(Vector2D *move){ return getLastNode()->createNextNode(move); }
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
                for(int i = 0; i < indexOfNodes;i++)
                    std::cout <<  nodes[i].getLocation()->getX() << " " << nodes[i].getLocation()->getY() << " " << std::endl;
            }
    };
}
#endif