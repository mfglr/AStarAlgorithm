#include <cstdlib>
#include <time.h>
#include <list>
#include <iostream>
#include "algorithm.h"
using namespace AStarAlgorithm;
using namespace std;

char *createPlatform(int size,int countOfBlock,Vector2D *start,Vector2D *end){
    srand(time(0)); 
    int size2 = size * size;
    char * platform = (char *)malloc(sizeof(char) * size2);
    
    for(int i = 0; i < size2; i++)
        platform[i] = 0;
    
    for(int i = 0; i < countOfBlock; i++){
        int randValue = rand() % size2;
        if(start->getX() * size + start->getY() != randValue && end->getX() * size + end->getY() != randValue)
            platform[randValue] = 1;
    }
    return platform;
}
void writePlatform(char *platform,int size){
    for(int j = 0; j < size; j++){
        for(int i = 0; i < size;i++)
            cout << (int)platform[i * size + j] << " ";
        cout << endl;
    }
}

int main(){

    int size = 15;
    Vector2D *start = new Vector2D(0,0),*end = new Vector2D(size - 1, size - 1);
    char *data = createPlatform(size,75,start,end);
    Platform platform = Platform(size,start,end,data);

    writePlatform(data,size);
    cout << endl;
    Algorithm algorithm = Algorithm(&platform);
    std::list<Path> paths = algorithm.run();

    for(std::list<Path>::iterator it = paths.begin();it != paths.end();it++){
        std::cout << "********************" << endl;
        it->write();
        std::cout << "********************" << endl;
    }
    return 0;

}