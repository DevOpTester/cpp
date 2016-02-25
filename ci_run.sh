#!/bin/bash
# Detects operating system type, runs preferred compiler,
# executes tests, and cleans up.

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
	./tests -s
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
	${CXX} main.cpp approx.cpp add.cpp -o add
	echo "Compiled. Now run main:"
	./add 
	echo "End of run"
	rm "add"
	echo "Files cleaned up"
}

echo "Currently located at " $PWD 
cd $HOME/testingCPP
echo "Now in " $PWD
run_tests
run_main
