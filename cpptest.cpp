#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch.hpp"

unsigned int add( unsigned int x, unsigned int y ) {
        return x+y;
}

TEST_CASE( "Addition preformed on unsigned integers", "[add]" ) {
  REQUIRE( add(1,2) == 3 );
  REQUIRE( add(1,200) == 201 );
  REQUIRE( add(1000,20) == 1020 );
  REQUIRE( add(1,41) == 42 );


}
