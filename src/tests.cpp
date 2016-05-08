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

TEST(PolygonTest, NotInPolygon){
    std::vector<Point> P;
    struct Point p0(1.0, 1.0), p1(2.0, 1.0), p2(3.0, 3.0), p3(4.0, 3.0);
    P.push_back(p0), P.push_back(p1), P.push_back(p2), P.push_back(p3),
        P.push_back(p0);
    struct Point q(.5, .5);

    ASSERT_FALSE(in_polygon(P, q));
}

TEST(NewtonRaphson, NearCMathSQRT){
   for (double i = 0.0; i < 200.0; ++i) {
   double a = std::abs(square_root(i) - sqrt(i));
   EXPECT_NEAR(0.0, a, .6);
  }
}

TEST(ApproxPi, isCloseToARCCOSneg1){
  EXPECT_LE(std::abs(approx_pi(1000) - acos(-1)), 0.01);
  EXPECT_LE(std::abs(approx_pi(100000) - acos(-1)), 0.001);
  EXPECT_LE(std::abs(approx_pi(1000000) - acos(-1)), 0.0001);
}


int main( int argc, char** argv ) {
    testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS( );
}
