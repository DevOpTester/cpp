#!/bin/bash
# compiles, executes tests, and cleans up.

function run_tests()
{
    if [ $OSTYPE == "linux-gnu" ]; then CXX="g++"; 
    fi
    echo
    echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
    echo "                         Running Catch tests                          "
    echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
    echo 
    ${CXX} catchDef.cpp tests.cpp approx.cpp add.cpp -o tests
    ./tests
    rm "tests"
}

function run_main()
{
    # Detects operating system type, runs preferred compiler,
    # executes main program, and cleans up.

    if [ $OSTYPE == "linux-gnu" ]; then CXX="g++"; 
    fi

    echo
    echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
    echo "              !!!!!!!Hello this is the main function!!!!!!              "
    echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
    echo 
    ${CXX} main.cpp approx.cpp add.cpp -o main
    echo "Compiled. Now run main:"
    ./main
    echo "End of run"
    rm "main"
    echo "Files cleaned up"
}

run_tests
run_main
