#ifndef Algorithm_h
#define Algorithm_h
#include "ros/ros.h"
#include "platform.h"
#include "path.h"
#include "node.h"
#include "a_star_algorithm/AlgorithmMessage.h"
#include "a_star_algorithm/PathMessage.h"
#include <list>
#include <iostream>
#include <vector>
namespace algorithm{
    class Algorithm{
        private :
            Platform *platform;
            Path *activePath;
            std::list<Path> paths; // the algorithm dynamically creates many paths when it runs 
            int index; // index of id;
            Path * getPathThatHasMinF(){
                std::list<Path>::iterator it = paths.begin();
                std::list<Path>::iterator r = it;
                int minF = it->f(platform->getEnd());
                it++;
                for(; it != paths.end();it++){
                    if(it->f(platform->getEnd()) < minF){
                        minF = it->f(platform->getEnd());
                        r = it;
                    }
                }
                return &(*r);
            }
            bool anyPath(){ return paths.begin() != paths.end(); }
        public :
            Algorithm(Platform *platform){
                index = 1;
                this->platform = platform;
                activePath = new Path(0,1,new Node(platform->getStart()->clone(),0));
                paths.push_front(*activePath);
            }
            void write(){
                std::cout << "platform => " << std::endl;
                platform->write();
                std::cout << "activePath => " << std::endl;
                activePath->write();
                for(std::list<Path>::iterator it = paths.begin();it != paths.end();it++){
                    it->write();
                    std::cout << std::endl;
                }
            }
            static void writeMessage(a_star_algorithm::AlgorithmMessage msg){
                std::cout << "platform => " << std::endl;
                Platform::writeMessage(msg.platform);
                std::cout << "activePath => " << std::endl;
                Path::writeMessage(msg.activePath);
                for(std::vector<a_star_algorithm::PathMessage>::iterator it = msg.paths.begin();it != msg.paths.end();it++){
                    Path::writeMessage((*it));
                    std::cout << std::endl;
                }
            }
            a_star_algorithm::AlgorithmMessage toMessage(){
                a_star_algorithm::AlgorithmMessage msg = a_star_algorithm::AlgorithmMessage();
                msg.platform = platform->toMessage();
                msg.activePath = activePath->toMessage();
                for(std::list<Path>::iterator it = paths.begin(); it != paths.end();it++)
                    msg.paths.push_back(it->toMessage());
                return msg;
            }
            void publish(ros::Publisher *pub,ros::Rate *rate){
                while(anyPath() && !activePath->IsItAtTheDestination(platform)){
                    rate->sleep();
                    for(int i = 0; i < countOfMoves;i++){
                        if(platform->canItMakeTheMove(activePath->getLastNode()->getLocation(),moves + i)){
                            Node *newNode = activePath->createNextNode(moves + i);
                            newNode->visit(platform);
                            Path newPath = activePath->cloneAndAddNode(index++,newNode);
                            paths.push_front(newPath);
                        }
                    }
                    paths.remove(*activePath);
                    activePath = getPathThatHasMinF();
                    pub->publish(toMessage());
                }

            }
    };
}
#endif
