#ifndef Platform_h
#define Platform_h
#include <stdlib.h>
#include "vector.h"
#include "a_star_algorithm/PlatformMessage.h"
#include <iostream>

namespace algorithm{
    class Platform{
        private :
            int size;
            Vector *start;
            Vector *end;
            int *data;
            int *visitedNodes;
            int getIndex(int x,int y) {return size * x + y; }
            int getIndex(Vector *l){ return size * l->getX() + l->getY(); }
            bool isInRange(Vector *l){
                return 0 <= l->getX() && l->getX() < size && 0 <= l->getY() && l->getY() < size;
            }
            int isVisited(Vector *l){ return visitedNodes[getIndex(l)]; }
            int isBlock(Vector *l){ return data[getIndex(l)]; }
        public :
            Vector *getEnd(){ return end; }
            Vector *getStart(){ return start; }
            bool canItMakeTheMove(Vector* location,Vector *move){
                Vector *newLocation = *location + *move;
                return isInRange(newLocation) && !isBlock(newLocation) && !isVisited(newLocation);
            }
            Platform(int size,Vector *start,Vector *end,int *data){
                this->size = size;
                this->start = start;
                this->end = end;
                this->data = data;
                visitedNodes = (int *)malloc(sizeof(int) * (size * size));
                for(int i = 0; i < size * size; i++)
                    visitedNodes[i] = 0;
            }
            Platform(a_star_algorithm::PlatformMessage msg){
                size = msg.size;
                int size2 = size * size;
                start = new Vector(msg.start);
                end = new Vector(msg.end);
                data = (int *)malloc(sizeof(int) * size2);
                visitedNodes = (int *)malloc(sizeof(int) * size2);
                for(int i = 0; i < size2; i++)
                    visitedNodes[i] = 0;
                for(int i = 0; i < size2;i++)
                    data[i] = msg.data[i];
            }
            void visit(Vector *l){ visitedNodes[getIndex(l)] = 1; }
            bool canItMove(Vector* location){
                for(int i = 0; i < countOfMoves;i++){
                    if(canItMakeTheMove(location,moves + i))
                        return true;
                }
                return false;
            }
            bool IsItAtTheDestination(Vector *l){ return *l == *end;}
            void write(){
                std::cout << "size : " << size << std::endl;
                std::cout << "start => " << std::endl;
                start->write();
                std::cout << "end => " << std::endl;
                end->write();
                std::cout << "data => " << std::endl;
                for(int i = 0; i < size * size; i++)
                    std::cout << data[i] << " ";
                std::cout << std::endl;
            }
            static void writeMessage(a_star_algorithm::PlatformMessage msg){
                std::cout << "size : " << msg.size << std::endl;
                std::cout << "start => " << std::endl;
                Vector::writeMessage(msg.start);
                std::cout << "end => " << std::endl;
                Vector::writeMessage(msg.end);
                std::cout << "data => " << std::endl;
                for(int i = 0; i < msg.size * msg.size; i++)
                    std::cout << msg.data[i] << " ";
                std::cout << std::endl;
            }
            a_star_algorithm::PlatformMessage toMessage(){
                a_star_algorithm::PlatformMessage msg = a_star_algorithm::PlatformMessage();
                int size2 = size * size;
                msg.size = size;
                msg.start = start->toMessage();
                msg.end = end->toMessage();
                for(int i = 0; i < size2; i++)
                    msg.data.push_back(data[i]);
                return msg;
            }
    };
}
#endif