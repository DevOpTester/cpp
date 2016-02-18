//main.cpp
#include "main.h"
#include <iostream>
#include "add.h"
#include "approx.h"
#include "catch.hpp"
using namespace std;

int main() {
	cout << "Two plus three is " << add(2,3) << endl;
    int trials = 100000;
    cout << "Using the monte carlo method, the value of pi is about: ";
    cout << approx_pi(trials) << endl;
    double val = 304.0;
    cout << "Using Newton-Raphson, the square root of " << val << " is : ";
    cout << square_root(val) << endl << endl;
    return 0;
}
