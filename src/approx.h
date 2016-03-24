//approx.h
#include <cstdlib>
#include <vector>
#ifndef APPROX_H_INCLUDED
#define APPROX_H_INCLUDED


// a data structure to represent a point
struct Point {
    double x;
    double y;
    
    Point(double x_, double y_) : x(x_), y(y_) {}
};
// a data structure to represent a polygon (ordered set of vertices)
typedef std::vector<Point> Polygon;

double approx_pi(int n) ;
double square_root(double a) ;
double integral(double a, double b, int n, double f(double c)) ;
bool in_polygon(const Polygon& P, const Point& q) ;
bool cross( const Polygon& P, const Point& q) ;

int paths(int n, int m) ;
int combinations(int n, int k) ;

#endif // APPROX_H_INCLUDED  
