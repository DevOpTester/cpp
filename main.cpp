//main.cpp
#include "main.h"
#include <iostream>
#include "add.h"
#include "montecarlopi.h"
#include "catch.hpp"
using namespace std;

int main() {
	cout << "Two plus three is " << add(2,3) << endl;
    int trials = 100000;
    cout << "Using the monte carlo method, the value of pi is about: ";
    cout << approx_pi(trials) << endl;
    return 0;
}
