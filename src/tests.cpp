#include <gtest/gtest.h>
#include "approx.cpp"
#include <cmath>

TEST(SquareRootTest, PositiveNos) {
  EXPECT_NEAR(6.0, square_root(36.0), 0.5);
  EXPECT_NEAR(18.0, square_root(324.0), 0.5);
  EXPECT_NEAR(25.4, square_root(645.16), 0.5);
  EXPECT_NEAR(0.0, square_root(0.0), 0.5);
}

TEST(SquareRootTest, NegativeNos) {
  ASSERT_EQ(-1.0, square_root(-15.0));
  ASSERT_EQ(-1.0, square_root(-0.2));
}

int main( int argc, char** argv ) {
    testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS( );
}
