#include "catchDef.h"
#include "catch.hpp"
#include "add.h"
#include "main.h"
#include "montecarlopi.h"


TEST_CASE( "Addition of two integers", "[add]" ) {
  REQUIRE( add(1, 1) == 2 );
}
TEST_CASE( "Addition of two doubles", "[add]" ) {
  double x = 34.0;
  double y = 72.0;
  
  REQUIRE( add(x, y) == 106.0 );
}
TEST_CASE( "Addition of two floats", "[add]" ) {
  double x = 3.0;
  double y = 7.0;
  
  REQUIRE( add(x, y) == 10.0 );
    }   
TEST_CASE( "Test <cmath> pow() function", "[cmath]") {
  REQUIRE( pow(100,0) == 1);
}
TEST_CASE( "Test <cmath> floor()", "[cmath]") {
  REQUIRE( floor(203.799) == 203);
}
TEST_CASE( "Test <cmath> fmod()", "[cmath]") {
  REQUIRE( fmod(9,2) == 1);
}
TEST_CASE( "Test that <cmath> acos() is the inverse of cos()", "[cmath]") {
  REQUIRE( cos(acos(-1.0))==-1.0);
}
TEST_CASE( "Test <cmath> cbrt()", "[cmath]") {
  REQUIRE( cbrt(27) == 3);
}
TEST_CASE( "Test <cmath> isnan()", "[cmath]") {
  REQUIRE( isnan(2.0) == 0);
}
TEST_CASE( "Test monte carlo approx_pi function", "[montecarlo]") {
    REQUIRE( abs(approx_pi(1000) - acos(-1)) < 0.01);
    REQUIRE( abs(approx_pi(100000) - acos(-1)) < 0.001);
    REQUIRE( abs(approx_pi(1000000) - acos(-1)) < 0.0001);
}
