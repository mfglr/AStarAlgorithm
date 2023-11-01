#ifndef CUSTOM_Vector2D
#define CUSTOM_Vector2D
#include <iostream>
namespace algorithm
{
    class Vector2D
    {
        int x;
        int y;

    public:
        Vector2D(int x, int y){ this->x = x; this->y = y; }
        bool operator==(Vector2D const &other) { return x == other.x && y == other.y; }
        bool operator!=(Vector2D const &other) { return x != other.x || y != other.y; }
        Vector2D *operator+(Vector2D const &other) { return new Vector2D(x + other.x, y + other.y); }
        int getX() { return x; }
        int getY() { return y; }
        Vector2D *clone() { return new Vector2D(x, y); }
        void write(){ std::cout << "x : " << x << " - y : " << y << std::endl; }
    };

    int countOfMoves = 4;
    Vector2D up = Vector2D(0, 1);
    Vector2D upRigth = Vector2D(1, 1);
    Vector2D right = Vector2D(1, 0);
    Vector2D downRight = Vector2D(1, -1);
    Vector2D down = Vector2D(0, -1);
    Vector2D downLeft = Vector2D(-1, -1);
    Vector2D left = Vector2D(-1, 0);
    Vector2D upLeft = Vector2D(-1, 1);
    Vector2D moves[] = {up, right, down, left};

}
#endif