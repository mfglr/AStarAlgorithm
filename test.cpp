
#include <iostream>
#include "vector2d.h"
using namespace std;
using namespace AStarAlgorithm;
int main(){

    Vector2D a = Vector2D(1,1);
    Vector2D b = Vector2D(2,2);
    Vector2D *c = (a + b)->clone();
    cout << c->getX() << " " << c->getY() << endl;
    return 0;
}