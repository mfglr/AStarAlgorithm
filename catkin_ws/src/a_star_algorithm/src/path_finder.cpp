#include "ros/ros.h"
#include <list>
#include <iostream>
#include <map>
#include <list>
#include <stdlib.h>
#include <queue>
#include <cstdlib> 
#include <time.h>
#include <limits.h>
#include "a_star_algorithm/GridMessage.h"

using namespace a_star_algorithm;
using namespace ros;
using namespace std;

int hz = 5;
int size = 15;
int size2 = size * size;


class Vector{
    int x;
    int y;
    public :
        Vector(int x,int y){
            this->x = x;
            this->y = y;
        }
        bool operator==(Vector const& other) {
            return x == other.x && y == other.y;
        }
        bool operator!=(Vector const& other) {
            return x != other.x || y != other.y;
        }
        Vector *operator+(Vector const& other)  {
            return new Vector(x + other.x,y + other.y); 
        }
        void write(){
            cout << "x : " << x << " - y : " << y << endl;
        }
        friend class Grid;
        friend class Node;
        friend class Algorithm;
};

int countOfMoves = 4;

Vector MOVES[] = { Vector(1,0),Vector(0,1), Vector(-1,0),Vector(0,-1) };

class Node{
    Vector *location;
    int g;
    int h;
    public :
        Node(){}
        Node(Vector *location,int g,Vector *dest){
            this->location = new Vector(location->x,location->y);
            this->g = g;
            h = abs(location->x - dest->x) + abs(location->y - dest->y);
        }
        int getG(){ return g; }
        Node *createNeighborNode(Vector *move,Vector *dest){
            return new Node(*location + *move,g+1,dest);
        }
        bool operator<(Node const& other) const {
            return g + h >= other.g + other.h;
        }
        Vector *getLocation(){ return location;}
        void write(){
            cout << "x : " << location->x << " - y : " << location->y << " - g : " << g << endl;
        }
        friend class Grid;
        friend class Algorithm;
};

class Grid{
    private :
        int *data;
        int *gScores;
        bool *statusOfopenSets;
        Publisher *publisher;
        Node *addresses;
        int size;
        int getIndexByNode(Node *x){
            return x->location->x * size + x->location->y;
        }
    public :
        Grid(int size,Publisher *publisher){
            int size2 = size * size;
            this->size = size;
            this->publisher = publisher;
            data = (int*)malloc(sizeof(int) * size2);
            statusOfopenSets = (bool *)malloc(sizeof(bool) * size2);
            gScores = (int *)malloc(sizeof(int) * size2);
            addresses = (Node *)malloc(sizeof(Node) * size2);
        }
        void init(Vector *start, Vector *end,int countOfBlock){
            srand(time(0));
            int size2 = size * size;
            for(int i = 0; i < size2;i++){
                data[i] = 0;
                statusOfopenSets[i] = false;
                gScores[i] = INT_MAX;
            }
            for(int i = 0; i < countOfBlock; i++)
            {
                Rate r(hz);
                int rValue = rand() % size2;
                Vector *v = new Vector(rValue / size,rValue % size);
                if(*v != *start && *v != *end){
                    data[rValue] = 1;
                    publisher->publish(toMessage());
                    r.sleep();
                }
                
            }
        }
        bool isValid(Node *x){
            return 
                x->location->x >= 0 && x->location->x < size && 
                x->location->y >= 0 && x->location->y < size && // are x and y values in range?
                data[getIndexByNode(x)] != 1; //Is the node block?
        }
        void write(){
            for(int j = 0; j < size;j++){
                for(int i = 0; i < size;i++)
                    cout << data[i * size + j] << " ";
                cout << endl;
            }
        }
        GridMessage toMessage(){
            GridMessage msg = GridMessage();
            msg.size = size;
            for(int i = 0; i < size * size;i++)
                msg.grid.push_back(data[i]);
            return msg;
        }
        void setValue(Node *node,int value){
            data[getIndexByNode(node)] = value;
        }
        friend class Algorithm;
};

 
class Algorithm{
    int size;
    int *gScores;
    bool *statusOfOpenSets;
    Publisher *publisher;
    Node *cameFrom;
    priority_queue<Node> openSet;
    Vector *start;
    Vector *end;
    Grid *grid;
    int getIndexByNode(Node *x){
        return x->location->x * grid->size + x->location->y;
    }
    void setGScore(Node *x){
        gScores[getIndexByNode(x)] = x->g; 
    }
    int getGScore(Node *x){
        return gScores[getIndexByNode(x)];
    }
    bool isInOpenSet(Node *x){
        return statusOfOpenSets[getIndexByNode(x)];
    }
    void setStatus(Node *x,bool status){
        statusOfOpenSets[getIndexByNode(x)] = status;
    }
    void setAddress(Node *neighbor,Node *current){
        cameFrom[getIndexByNode(neighbor)] = *current;
    }
    Node *getAddress(Node *current){
        return &cameFrom[getIndexByNode(current)]; 
    }
    list<Node> reconstruct_path(Node* current){
        list<Node> path;
        Node *iter = current;
        path.push_front(*iter);
        while(*(iter->getLocation()) != *start){
            iter = getAddress(iter);
            path.push_front(*iter);
        }
        return path;
    }
    public :
        Algorithm(int size,Publisher *publisher){
            this->size = size;
            int size2 = size * size;
            this->publisher = publisher;
            this->grid = new Grid(size,publisher);
            statusOfOpenSets = (bool *)malloc(sizeof(bool) * size2);
            gScores = (int *)malloc(sizeof(int) * size2);
            cameFrom = (Node *)malloc(sizeof(Node) * size2);
        }
        void init(Vector *start,Vector *end,int countOfBlocks){
            int size2 = size * size;
            this->start = start;
            this->end = end;
            grid->init(start,end,countOfBlocks);
            for(int i = 0; i < size2; i++){
                statusOfOpenSets[i] = false;
                gScores[i] = INT_MAX;
            }
            openSet.push(Node(start,0,end));
            statusOfOpenSets[0] = true;
        }
        Grid *getGrid(){
            return grid;
        }
        list<Node> run(){
            Rate r(hz);
            Node current;

            grid->setValue(new Node(start,0,end),2);
            publisher->publish(grid->toMessage());
            r.sleep();

            while (!openSet.empty() && (*((current = openSet.top()).getLocation())) != *end) {
                openSet.pop();
                setStatus(&current,false);
                for (int i = 0; i < countOfMoves;i++) {
                    Node *next = current.createNeighborNode(MOVES + i,end);
                    if (grid->isValid(next) && next->getG() < getGScore(next)){
                        setGScore(next);
                        setAddress(next,&current);
                        if (!isInOpenSet(next)){
                            openSet.push(*next);
                            setStatus(next,true);
                        }
                        grid->setValue(next,2);
                        publisher->publish(grid->toMessage());
                        r.sleep();
                    }
                }
            }
            return reconstruct_path(&current);
        }
};
 

int main(int argc,char**argv)
{
    init(argc,argv,"PathFinder");
    NodeHandle n;
    Publisher nodePublisher = n.advertise<GridMessage>("grid",10);
    Rate r(hz);
    int size = 15;
    Vector *start = new Vector(0,0),*end = new Vector(size - 1,size - 1); 
    Algorithm a = Algorithm(size,&nodePublisher);
    a.init(start,end,75);
    a.getGrid()->write();
    list<Node> path = a.run();

    for(list<Node>::iterator it = path.begin(); it != path.end(); it++){
        a.getGrid()->setValue(&*it,3);
        nodePublisher.publish(a.getGrid()->toMessage());
        r.sleep();
    }
    return 0;
}
