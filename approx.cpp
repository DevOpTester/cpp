//approx.cpp
#include "approx.h"
#include "catch.hpp"
#include "main.h"
#include <cstdlib>

// n is the number of points generated
// returns an approximation of pi
// the accuracy increases with trials run

double approx_pi(int n) {
	int nin = 0;
    double randmax = double(RAND_MAX);
    for (int i = 0; i < n; ++i) {
        double x = rand()/randmax;
        double y = rand()/randmax;
        if (x*x + y*y < 1) nin = nin + 1;
    }
    return 4.0*nin/n;
}

double square_root(double a) {
    // a must be greaterthan or equal to 0
    // using Newton-Raphson method
    // returns x such that abs(x*x - a) < epsilon

    double x = 1.0; // makes a guess

    // Iterates using Newton-Raphson recurrence
    while (abs(x*x - a) >= std::numeric_limits<double>::epsilon()) x = 0.5*(x + a/x);

    return x;
}
