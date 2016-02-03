#include "catchDef.h"
#include "catch.hpp"
#include "add.h"
#include "main.h"


TEST_CASE( "Addition of two integers", "[add]" ) {
  REQUIRE( add(1, 1) == 2 );
    }
