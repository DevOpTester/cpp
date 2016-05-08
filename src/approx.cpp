// approx.cpp
#include "approx.h"
#include <cstdlib>
#include <iostream>
#include <vector>

/*************************************************************

      The following are mostly thanks to Jordi Cortadella's

      Introduction to Programming (in C++) Numerical Methods I

      (with some tweaking)

*************************************************************/

// monte carlo method for approximating pi
// takes integer 'n', the number of trials
// returns an approximation of pi
// the accuracy increases with trials run

double approx_pi(int n) {
  int nin = 0;
  double randmax = double(RAND_MAX);
  for (int i = 0; i < n; ++i) {
    double x = rand() / randmax;
    double y = rand() / randmax;
    if (x * x + y * y < 1)
      nin = nin + 1;
  }
  return 4.0 * nin / n;
}

double square_root(double a) {
  // a must be greaterthan or equal to 0
  // using Newton-Raphson method
  // returns x such that abs(x*x - a) < epsilon

  if (a < 0) { // check for negative number
    return -1.0;
  } else {
    double x = 1.0; // makes a guess

    // Iterates using Newton-Raphson recurrence
    while (abs(x * x - a) >= std::numeric_limits<double>::epsilon())
      x = 0.5 * (x + a / x);

    return x;
  }
}

double integral(double a, double b, int n, double f(double)) {
  // a is starting point, b is end point, n is number of intervals
  // b >=a, n > 0
  // Returns the value of the approximate integral between a and b
  // using n intervals (the trapezoidal method)

  double h = (b - a) / n;

  double s = 0;
  for (int i = 1; i < n; ++i)
    s = s + f(a + i * h);

  return (f(a) + f(b) + 2 * s) * h / 2;
}

/******************

We can determine if a point is in the polygon by projecting a ray from the point
and counting how many of the sides of
the polygon it goes through.

If it goes through an even number, it is outside.
Else, it goes through and odd number, it
is inside.

*****************/

bool cross(const Point &p1, const Point &p2, const Point &q) {
  // check whethere q.y is between p1.y and p2.y
  if ((p1.y > q.y) == (p2.y > q.y))
    return false;

  // Calculate the x coordinate of the crossing point
  double xc = p1.x + (q.y - p1.y) * (p2.x - p1.x) / (p2.y - p1.y);
  return xc > q.x;
}

bool in_polygon(const Polygon &P, const Point &q) {
  // returns true if point q is inside polygon P,
  // and false otherwise

  int nvert = P.size();
  int src = nvert - 1;
  int ncross = 0;

  // Visit all the edges of the polygon
  for (int dst = 0; dst < nvert; ++dst) {
    if (cross(P[src], P[dst], q))
      ++ncross;
    src = dst;
  }

  return ncross % 2 == 1;
}

/*******************************************
Calculate the number of paths through an nXm grid
(n and m must be greater than or equal to 0)
*******************************************/

int paths(int n, int m) { return combinations(n + m, n); }

int combinations(int n, int k) {
  if (k == 0)
    return 1;
  return n * combinations(n - 1, k - 1) / k;
}
