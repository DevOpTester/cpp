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
    ${CXX} src/catchDef.cpp src/tests.cpp src/approx.cpp src/add.cpp -o bin/tests
    ./bin/tests -s
    rm "bin/tests"
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
    ${CXX} src/main.cpp src/approx.cpp src/add.cpp -o bin/main
    echo "Compiled. Now run main:"
    ./bin/main
    valgrind ./bin/main
    echo "End of run"
    rm "bin/main"
    echo "Files cleaned up"
}

run_tests
run_main
