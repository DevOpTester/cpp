#!/bin/sh
# Installs PETSc, MPI, compilers, compiles and runs tests and main 

function license_statement()
{
	echo
	echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
	echo "             testingCPP is a CI and C++ testing project"
	echo
	echo "                  Copyright (C) 2016 Elijah DeLee"
	echo "                  Licensed under the MIT License."
	echo "         See the file LICENSE.txt for the full license text."
	echo
	echo "         Written by Elijah DeLee <https://github.com/deleeke>"
	echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
	echo
}

function install_trusty_dep()
{
	if [ "$OSTYPE" = "linux-gnu" ];
	then echo "Installing dependencies for ${OSTYPE}";
	echo
	time sudo apt-get update -qq
	time sudo apt-get install cmake
	time sudo apt-get install gcc-4.8 g++-4.8 -qq
    time sudo apt-get install gfortran -qq
    time sudo apt-get install valgrind
    rm valgrind.log*
	echo "${CXX} will be your compiler"
	CXX="g++";
	fi
}

function install_PETSc()
{
  time git clone -b maint https://bitbucket.org/petsc/petsc $HOME/petsc
  cd $HOME/petsc/
  time ./configure --with-cc=gcc --with-cxx=g++ --with-fc=gfortran --download-fblaslapack --download-mpich
  time make all test 
  cd $HOME 
} 

function install_trusty_dep()
{
	if [ "$OSTYPE" = "linux-gnu" ];
	then echo "Installing dependencies for ${OSTYPE}";
	echo
	#https://launchpad.net/~plfiorini/+archive/ubuntu/cmake
#	echo "yes" | sudo add-apt-repository ppa:plfiorini/cmake ;
	#https://wiki.ubuntu.com/ToolChain
#	echo "yes" | sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
	time sudo apt-get update -qq
	time sudo apt-get install cmake
	time sudo apt-get install gcc-4.8 g++-4.8 -qq
    time sudo apt-get install gfortran -qq
#	sudo apt-get upgrade -qq
	echo "${CXX} will be your compiler"
	CXX="g++";
	fi
}


function run_tests()
{
	if [ $OSTYPE == "linux-gnu" ]; then CXX="g++"; 
	fi
	echo
	echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
	echo "                         Running Catch tests                          "
	echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
	echo 
    cd $HOME/testingCPP
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
    cd $HOME/testingCPP
	${CXX} main.cpp approx.cpp add.cpp -o add
	echo "Compiled. Now run main:"
	./add 
	echo "End of run"
	rm "add"
	echo "Files cleaned up"
}

#Call functions

license_statement
#install_MPI
install_trusty_dep
install_PETSc
run_tests
run_main
exit 0
