#include <cstdlib>
#include <time.h>
#include <list>
using namespace std;

class Point{
    public :
        int x;
        int y;
        Point(int x,int y){
            this->x = x;
            this->y = y;
        }
        bool IsEqual(Point *point){
            return this->x == point->x && this->y == point->y;
        }
};

class PathItem{
    private :
        int h(){
            point->x + point->y;
        }
    public :
        Point *point;
        int g;
        PathItem(Point *p,int g){
            this->point = p;
            this->g = g;
        }
        int f(){
            return h() + g;
        }
        PathItem *getRightStep(){
            return new PathItem(new Point(this->point->x + 1,this->point->y),this->g + 1);
        }
        PathItem *getDownStep(){
            return new PathItem(new Point(this->point->x,this->point->y + 1),this->g + 1);
        }
};

class Path{
    private :
        list<PathItem> pathItems;
    public :
        Path(){
        }
        void addItem(Point *p,int g){
            pathItems.push_front(PathItem(p,g));
        }
        PathItem *getLastItem(){
            pathItems.pop_front();
        }
};

class Platform{
    private :
        int size;
        bool **platform;
        Point *start;
        Point *end;

    public :
        Platform(int size,Point *start,Point *end){
            this->size = size;
            this->start = start;
            this->end = end;
            platform = (bool**)malloc(sizeof(bool*) * size);
            for(int i = 0; i < size; i++)
                platform[i] = (bool*)malloc(sizeof(bool) * size);
        }

        void InitPlatform(int sizeOfBlock){
            srand(time(0)); 
            int size2 = size * size;
            for(int i = 0; i < sizeOfBlock; i++){
                int a = rand() % size2;
                platform[a / size][a % size] = true;
            }
        }

        bool CanItMoveToRight(Point *point){
            int nextStep = point->x + 1;
            return !platform[nextStep][point->y] && nextStep < size;
        }

        bool CanItMoveToDown(Point *point){
            int nextStep = point->y + 1;
            return !platform[point->x][nextStep] && nextStep < size;;
        }

        bool CanItMove(Point *point){
            return CanItMoveToRight(point) || CanItMoveToDown(point);
        }

        bool IsItAtTheDestination(Point *point){
            return point->IsEqual(end);
        }
};

int main(){

    Point start = Point(0,0);
    Point end = Point(9,9);
    Platform platform = Platform(10,&start,&end);

    Path root;
    Path * activePath = &root;
    list<Path> paths;
    paths.push_back(root);

    // do{
    //     PathItem *item = activePath->getLastItem();
    //     if(platform.CanItMoveToRight(item->point)){
    //         Path newPath = Path(*activePath);
    //     }
    //     if(platform.CanItMoveToDown(item->point)){

    //     }
    // }while();

    return 0;
}