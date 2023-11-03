#include "ros/ros.h"
#include "a_star_algorithm/GridMessage.h"
#include <iostream>
#include <stdlib.h>

#ifndef COLORS
#define COLORS

#define RST  "\x1B[0m"
#define BLACK "\033[1m\033[30m"
#define KRED  "\x1B[31m"
#define KGRN  "\x1B[32m"
#define KYEL  "\x1B[33m"
#define KBLU  "\x1B[34m"
#define KMAG  "\x1B[35m"
#define KCYN  "\x1B[36m"
#define KWHT  "\x1B[37m"

#define FRED(x) KRED x RST
#define FGRN(x) KGRN x RST
#define FYEL(x) KYEL x RST
#define FBLU(x) KBLU x RST
#define FMAG(x) KMAG x RST
#define FCYN(x) KCYN x RST
#define FWHT(x) KWHT x RST
#define FBLACK(x) BLACK x RST
#define BOLD(x) "\x1B[1m" x RST
#define UNDL(x) "\x1B[4m" x RST

#endif 

using namespace ros;
using namespace std;
using namespace a_star_algorithm;


int size;
int size2;
int *grid;

void displayGrid(GridMessage msg){
    system("clear");
    for(int j = 0; j < size; j++){
        for(int i = 0; i < size; i++){
            if(msg.grid[i * size + j] == 0)
                cout << FYEL("*") << " ";
            else if(msg.grid[i * size + j] == 1)
                cout << FBLACK("*") << " ";
            else if(msg.grid[i * size + j] == 2)
                cout << FBLU("*") << " ";
            else if(msg.grid[i * size + j] == 3)
                cout << "*" << " ";
        }
        cout << endl;
    }
}

void getGrid(GridMessage msg){
    size = msg.size;
    size2 = size * size;
    displayGrid(msg);
}

int main(int argc,char **argv){
    init(argc,argv,"Simulation");
    NodeHandle n = NodeHandle();
    grid = (int *)malloc(sizeof(int) * size * size);
    for(int i = 0; i <size2; i++ )
        grid[i] = 0;
    Subscriber nodeSubscriber = n.subscribe("grid",10,getGrid);
    spin();
}