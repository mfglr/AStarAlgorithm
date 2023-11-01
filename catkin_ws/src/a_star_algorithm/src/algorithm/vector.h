#ifndef CUSTOM_Vector
#define CUSTOM_Vector
#include "a_star_algorithm/VectorMessage.h"
#include <iostream>

namespace algorithm
{
    class Vector
    {
        int x;
        int y;

    public:
        Vector(int x, int y){ this->x = x; this->y = y; }
        Vector(a_star_algorithm::VectorMessage msg){ x = msg.x; y = msg.y; }
        bool operator==(Vector const &other) { return x == other.x && y == other.y; }
        bool operator!=(Vector const &other) { return x != other.x || y != other.y; }
        Vector *operator+(Vector const &other) { return new Vector(x + other.x, y + other.y); }
        int getX() { return x; }
        int getY() { return y; }
        Vector *clone() { return new Vector(x, y); }
        void write(){ std::cout << x << " - " << y << std::endl; }
        static void writeMessage(a_star_algorithm::VectorMessage msg){
            std::cout << msg.x << " - " << msg.y << std::endl;
        }
        a_star_algorithm::VectorMessage toMessage(){
            a_star_algorithm::VectorMessage msg = a_star_algorithm::VectorMessage();
            msg.x = x;
            msg.y = y;
            return msg;
        }
    };

    int countOfMoves = 4;
    Vector up = Vector(0, 1);
    Vector upRigth = Vector(1, 1);
    Vector right = Vector(1, 0);
    Vector downRight = Vector(1, -1);
    Vector down = Vector(0, -1);
    Vector downLeft = Vector(-1, -1);
    Vector left = Vector(-1, 0);
    Vector upLeft = Vector(-1, 1);
    Vector moves[] = {up, right, down, left};
}
#endif