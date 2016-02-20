//main.cpp
#include "main.h"
#include <iostream>
#include "add.h"
#include "approx.h"
#include "catch.hpp"
using namespace std;

double a_funct(double x){
    return x*x;
    }

int main() {
	cout << "Two plus three is " << add(2,3) << endl;
    int trials = 100000;
    cout << "Using the monte carlo method, the value of pi is about: ";
    cout << approx_pi(trials) << endl;
    double val = 304.0;
    cout << "Using Newton-Raphson, the square root of " << val << " is : ";
    cout << square_root(val) << endl << endl;
    cout << "The integral of (x*x) from 2.0 to 3.0 using 1000 intervals is: ";
    cout << integral(2.0, 3.0, 1000, *a_funct) << endl << endl;
    struct Point p0( 1.0, 3.0);
    struct Point p1( 4.0, 1.0);
    struct Point p2( 7.0, 3.0);
    struct Point p3( 5.0, 4.0);
    struct Point p4( 6.0, 7.0);
    struct Point p5( 2.0, 6.0);
      
    std::vector<Point> P;
    P.push_back(p0), P.push_back(p1);
    P.push_back(p2), P.push_back(p3);
    P.push_back(p4), P.push_back(p5);
    P.push_back(p0);
    struct Point q( 2.0, 3.0);
    struct Point outside( 1.0, 1.0);
    cout << "Print point q (" << q.x << ", " << q.y << ")" << endl;  
    cout << "Print point p0 (" << p0.x << ", " << p0.y << ")" << endl; 
    cout << in_polygon(P, q) << endl;
    cout << in_polygon(P, outside) << endl;
    return 0;
}
