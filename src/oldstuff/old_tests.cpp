#include "catchDef.h"
#include "catch.hpp"
#include "add.h"
#include "main.h"
#include "approx.h"

TEST_CASE("Addition of two integers", "[add]") { REQUIRE(add(1, 1) == 2); }
TEST_CASE("Addition of two doubles", "[add]") {
  double x = 34.0;
  double y = 72.0;

  REQUIRE(add(x, y) == 106.0);
}
TEST_CASE("Addition of two floats", "[add]") {
  double x = 3.0;
  double y = 7.0;

  REQUIRE(add(x, y) == 10.0);
}
TEST_CASE("Test <cmath> pow() function", "[cmath]") {
  REQUIRE(pow(100, 0) == 1);
}
TEST_CASE("Test <cmath> floor()", "[cmath]") { REQUIRE(floor(203.799) == 203); }
TEST_CASE("Test <cmath> fmod()", "[cmath]") { REQUIRE(fmod(9, 2) == 1); }
TEST_CASE("Test that <cmath> acos() is the inverse of cos()", "[cmath]") {
  REQUIRE(cos(acos(-1.0)) == -1.0);
}
TEST_CASE("Test <cmath> cbrt()", "[cmath]") { REQUIRE(cbrt(27) == 3); }
TEST_CASE("Test <cmath> isnan()", "[cmath]") { REQUIRE(isnan(2.0) == 0); }
TEST_CASE("Test monte carlo approx_pi function", "[montecarlo]") {
  REQUIRE(std::abs(approx_pi(1000) - acos(-1)) < 0.01);
  REQUIRE(std::abs(approx_pi(100000) - acos(-1)) < 0.001);
  REQUIRE(std::abs(approx_pi(1000000) - acos(-1)) < 0.0001);
}

TEST_CASE("Test Newton-Raphson square root against <cmath> sqrt()", "[sqrt]") {
  for (double i = 0.0; i < 200.0; ++i) {
    REQUIRE(std::abs(square_root(i) - sqrt(i)) < 0.6);
  }
}

TEST_CASE("Test  in_polygon for detecting point not in polygon", "[polygon]") {

  SECTION("Initialize and test a polygon") {

    std::vector<Point> P;
    struct Point p0(1.0, 1.0), p1(2.0, 1.0), p2(3.0, 3.0), p3(4.0, 3.0);
    P.push_back(p0), P.push_back(p1), P.push_back(p2), P.push_back(p3),
        P.push_back(p0);
    struct Point q(.5, .5);

    REQUIRE(in_polygon(P, q) == false);
  }
  /*********************************************************************
      SECTION("Create a random polygon and test if a point is in it");{

      int n = 12;
      std::vector<Point> Q;
      struct Point start( 1.0, 1.0);
          for (int i = 0; i < n; ++i) {
               if (i == 0) Q.push_back(start);
               double a = rand();
               double b = rand();
               struct Point q(a, b);
               Q.push_back(q);
               }

              struct Point z((Q[0].x + 1.0) , (Q[0].y + 1));
              REQUIRE( in_polygon(Q, z) == true);

      }
  ***********************************************************************/
}

// TEST_CASE( "Test approximation of integral using trapezoidal function" ,
// "[integral]") {}
