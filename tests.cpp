#include "catchDef.h"
#include "catch.hpp"
#include "add.h"
#include "main.h"


TEST_CASE( "Addition of two integers", "[add]" ) {
  REQUIRE( add(1, 1) == 2 );
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

