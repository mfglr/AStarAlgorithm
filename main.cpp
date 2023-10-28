#include <cstdlib>
#include <time.h>
#include <list>
#include <iostream>
using namespace std;

class Point{
    public :
        int x;
        int y;
        Point(int x,int y){ this->x = x; this->y = y;}
        bool operator==(Point const& other){ return x == other.x && y == other.y; }
        bool operator!=(Point const& other){ return x != other.x || y != other.y; }
};

class Platform{
    private :
        int size;
        bool **platform;
        bool **visitedNodes;
        bool isInRange(int value){ return 0 <= value && value < size; }
        bool isVisited(int x,int y){ return visitedNodes[x][y]; }
        bool isBlock(int x,int y){ return platform[x][y]; }
    public :
        Point *start;
        Point *end;
        Platform(int size,Point *start,Point *end){
            this->size = size;
            this->start = start;
            this->end = end;
            platform = (bool**)malloc(sizeof(bool*) * size);
            visitedNodes = (bool**)malloc(sizeof(bool*) * size);
            for(int i = 0; i < size; i++){
                platform[i] = (bool*)malloc(sizeof(bool) * size);
                visitedNodes[i] = (bool*)malloc(sizeof(bool) * size);
                for(int j = 0; j < size;j++){
                    platform[i][j] = false;
                    visitedNodes[i][j] = false;
                }
            }
        }
        void InitPlatform(int sizeOfBlock){
            srand(time(0)); 
            int size2 = size * size;
            for(int i = 0; i < sizeOfBlock; i++){
                int a = rand() % size2;
                int x = a / size;
                int y = a % size;
                Point p = Point(x,y);
                if(p != *start && p != *end)
                    platform[x][y] = true;
            }
        }
        void visit(int x,int y){ visitedNodes[x][y] = true; }
        bool CanItMoveRight(Point *point){return isInRange(point->x + 1) && !isBlock(point->x + 1,point->y) && !isVisited(point->x + 1,point->y); }
        bool CanItMoveLeft(Point *point){ return isInRange(point->x - 1) && !isBlock(point->x - 1,point->y) && !isVisited(point->x - 1,point->y); }
        bool CanItMoveUp(Point *point){ return isInRange(point->y - 1) && !isBlock(point->x,point->y - 1) && !isVisited(point->x,point->y - 1); }
        bool CanItMoveDown(Point *point){ return isInRange(point->y + 1) && !isBlock(point->x,point->y + 1) && !isVisited(point->x,point->y + 1); }
        bool CanItMove(Point *point){ return CanItMoveRight(point) || CanItMoveLeft(point) || CanItMoveUp(point) || CanItMoveDown(point); }
        bool IsItAtTheDestination(Point *point){ return *point == *end; }
        void write(){
            for(int i = 0 ; i < size;i++){
                for(int j = 0; j < size;j++)
                    if(platform[j][i])
                        cout << "1 ";
                    else
                        cout << "0 ";
                cout << endl;
            }
        }
};

class Node{
    private :
        // l1 norm
        int h(Point *destination){ abs(destination->x - point->x) + abs(destination->y - point->y); }
    public :
        Point *point;
        int g;
        Node(int x,int y,int g){ this->point = new Point(x,y); this->g = g; }
        int f(Point *destination){ return h(destination) + g; }
        Node *createRightNode() { return new Node(point->x + 1,point->y,g + 1); }
        Node *createLeftNode() { return new Node(point->x - 1,point->y,g + 1); }
        Node *createUpNode() { return new Node(point->x,point->y - 1,g + 1); }
        Node *createDownNode(){ return new Node(point->x,point->y + 1,g + 1); }
        Node *clone(){ return new Node(point->x,point->y,g); }
        void markNodeAsVisited(Platform *platform){ platform->visit(point->x,point->y); }
        void write(){
            cout << point->x << " " << point->y << endl; 
        }
};

class Path{
    private :
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
        int id;
    public :
        Path(int id,int sizeOfNodes,Node *node){ 
            this->id = id;
            this->sizeOfNodes = sizeOfNodes;
            indexOfNodes = 1;
            nodes = (Node *)malloc(sizeof(Node) * sizeOfNodes);
            nodes[0] = *node;
        }
        Node *getLastNode(){ return nodes + (indexOfNodes - 1); }
        bool operator==(Path const& other){ return this->id == other.id; }
        Node *createRightNode(){ return getLastNode()->createRightNode(); }
        Node *createLeftNode(){ return getLastNode()->createLeftNode(); }
        Node *createUpNode(){ return getLastNode()->createUpNode(); }
        Node *createDownNode(){ return getLastNode()->createDownNode(); }
        int f(Point *destination){ getLastNode()->f(destination); }
        bool IsItAtTheDestination(Platform * platform){ return platform->IsItAtTheDestination(getLastNode()->point);}
        bool CanItMoveRight(Platform *platform){ platform->CanItMoveRight(getLastNode()->point); }
        bool CanItMoveLeft(Platform *platorm){ platorm->CanItMoveLeft(getLastNode()->point); }
        bool CanItMoveUp(Platform *platorm){ platorm->CanItMoveUp(getLastNode()->point); }
        bool CanItMoveDown(Platform *platorm){ platorm->CanItMoveDown(getLastNode()->point); }
        bool CanItMove(Platform *platform){
            return CanItMoveRight(platform) ||  CanItMoveLeft(platform) || CanItMoveUp(platform) || CanItMoveDown(platform);
        }
        Path cloneAndAddNode(int id,Node *node){
            Path path = Path(id,sizeOfNodes + 1);
            for(int i = 0; i < sizeOfNodes;i++)
                path.addNode(getNodeByIndex(i)->clone());
            path.addNode(node);
            return path;
        }
        void write(){
            cout << "id : " << id << endl;
            for(int i = 0; i < indexOfNodes;i++)
                cout <<  nodes[i].point->x << " " << nodes[i].point->y << " " << nodes[i].g << endl;
        }
};

class AStartAlgorithm{
    private :
        Platform *platform;
        Path *root;
        Path *activePath;
        list<Path> paths; // the algorithm dynamically creates many paths when it runs 
        int index; // index of id;
        Path * getPathThatHasMinF(){
            list<Path>::iterator it = paths.begin();
            list<Path>::iterator r = it;
            int minF = it->f(platform->end);
            it++;
            for(; it != paths.end();it++){
                if(it->f(platform->end) < minF){
                    minF = it->f(platform->end);
                    r = it;
                }
            }
            return &(*r);
        }
        bool isAllPathStucked(){
            for(list<Path>::iterator it = paths.begin(); it != paths.end();it++)
                if(it->CanItMove(platform))
                    return false;
            return true;
        }
        bool isThereAnyPathOnDestination(){
            for(list<Path>::iterator it = paths.begin(); it != paths.end();it++)
                if(it->IsItAtTheDestination(platform)){
                    activePath = &*it;
                    return true;
                }
            return false;
        }
    public :
        AStartAlgorithm(Platform *platform){
            index = 1;
            this->platform = platform;
            root = new Path(0,1,new Node(platform->start->x,platform->start->y,0));
            paths.push_front(*root);
            activePath = root;
        }
        void write(){
            cout << "**************************" << endl;
            for(list<Path>::iterator it = paths.begin(); it != paths.end();it++)
                it->write();
            cout << "**************************" << endl;

        }
        Path * run(){
            while(!isThereAnyPathOnDestination() && !isAllPathStucked()){
                if(activePath->CanItMoveRight(platform)){
                    Node *newNode = activePath->createRightNode();
                    newNode->markNodeAsVisited(platform);
                    Path newPath = activePath->cloneAndAddNode(index++,newNode);
                    paths.push_front(newPath);
                }
                if(activePath->CanItMoveLeft(platform)){
                    Node *newNode = activePath->createLeftNode();
                    newNode->markNodeAsVisited(platform);
                    Path newPath = activePath->cloneAndAddNode(index++,newNode);
                    paths.push_front(newPath);
                }
                if(activePath->CanItMoveUp(platform)){
                    Node *newNode = activePath->createUpNode();
                    newNode->markNodeAsVisited(platform);
                    Path newPath = activePath->cloneAndAddNode(index++,newNode);
                    paths.push_front(newPath);
                }
                if(activePath->CanItMoveDown(platform)){
                    Node *newNode = activePath->createDownNode();
                    newNode->markNodeAsVisited(platform);
                    Path newPath = activePath->cloneAndAddNode(index++,newNode);
                    paths.push_front(newPath);
                }
                paths.remove(*activePath);
                activePath = getPathThatHasMinF();
            }
            return activePath;
        }
};

int main(){

    int size = 10;
    Point startPoint = Point(0,0),endPoint = Point(size - 1, size - 1);
    Platform platform = Platform(size,&startPoint,&endPoint);
    platform.InitPlatform(30);
    platform.write();

    cout << endl;
    AStartAlgorithm algorithm = AStartAlgorithm(&platform);
    Path *path = algorithm.run();
    path->write();
    return 0;

}