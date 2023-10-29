#ifndef Algorithm_h
#define Algorithm_h
#include "platform.h"
#include "path.h"
#include "node.h"
#include <iostream>
#include <list>
namespace AStarAlgorithm{
    class Algorithm{
        private :
            Platform *platform;
            Path *root;
            Path *activePath;
            std::list<Path> paths; // the algorithm dynamically creates many paths when it runs 
            std::list<Path> solutions;
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
            bool isAllPathStucked(){
                for(std::list<Path>::iterator it = paths.begin(); it != paths.end();it++){
                    if(it->CanItMove(platform))
                        return false;
                }
                return true;
            }
            void isThereAnyPathOnDestination(){
                for(std::list<Path>::iterator it = paths.begin(); it != paths.end();it++){
                    if(it->IsItAtTheDestination(platform))
                        solutions.push_front(*it);
                }
            }
        public :
            Algorithm(Platform *platform){
                index = 1;
                this->platform = platform;
                root = new Path(0,1,new Node(platform->getStart()->clone(),0));
                paths.push_front(*root);
                activePath = root;
            }
            std::list<Path> run(){
                while(!isAllPathStucked()){
                    for(int i = 0; i < countOfMoves;i++){
                        if(platform->canItMakeTheMove(activePath->getLastNode()->getLocation(),moves + i)){
                            Node *newNode = activePath->createNextNode(moves + i);
                            newNode->visit(platform);
                            Path newPath = activePath->cloneAndAddNode(index++,newNode);
                            paths.push_front(newPath);
                        }
                    }
                    isThereAnyPathOnDestination();
                    paths.remove(*activePath);
                    activePath = getPathThatHasMinF();
                }
                return solutions;
            }
    };
}
#endif