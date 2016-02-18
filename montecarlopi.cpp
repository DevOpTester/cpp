//montecarlopi.cpp
#include "montecarlopi.h"
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

