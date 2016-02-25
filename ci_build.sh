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

# following function install_MPI() adapted from https://github.com/mpi4py/mpi4py/blob/master/conf/travis/install-mpi.sh
#Author: Lisandro Dalcin
#Contact:	dalcinl@gmail.com
#Copyright (c) 2015, Lisandro Dalcin. All rights reserved.

function install_MPI()
{
    set -e
    case $1 in
        mpich1) set -x;
            sudo apt-get install -q mpich-shmem-bin libmpich-shmem1.0-dev;;
        mpich2) set -x;
            sudo apt-get install -q mpich2 libmpich2-3 libmpich2-dev;;
        mpich3) set -x;
            sudo apt-get install -q gfortran libcr0 default-jdk;
            wget http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz;
    
            mkdir $HOME/mpich3.2-install;
            mv mpich-3.2.tar.gz $HOME/mpich3.2-install;
            tar xfz $HOME/mpich3.2-install/mpich-3.2.tar.gz
            ./configure CC=gcc CXX=g++ F77=gfortran FC=gfortran --prefix=$HOME/mpich3.2-install --enable-fast make make install;;
        openmpi) set -x;
            sudo apt-get install openmpi-bin openmpi-dev
            export PATH=$HOME/mpich3.1-install/bin:$PATH;;
        *)
            echo "Unknown MPI implementation:" $1; exit 1;;
    esac
}

function install_PETSc()
{
  time git clone -b maint https://bitbucket.org/petsc/petsc $HOME/petsc
  cd $HOME/petsc/
  time ./configure --with-cc=gcc --with-cxx=g++ --with-fc=gfortran --download-fblaslapack --download-mpich
  time make all test  
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

	${CXX} catchDef.cpp tests.cpp approx.cpp add.cpp -o tests
	./tests -s
	rm "tests"
}

function run_main()
{
	# Detects operating system type, runs preferred compiler,
	# executes main program, and cleans up.

	if [ $OSTYPE == "linux-gnu" ]; then CXX="g++"; 
	else CXX="clang++"
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

#Call functions

license_statement
#install_MPI
install_trusty_dep
install_PETSc
run_tests
run_main
exit 0
