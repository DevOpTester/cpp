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
	echo "========================================="
	echo
	echo "Installing dependencies for ${OSTYPE}";
	echo
	echo "=========================================="
	time sudo apt-get update -qq
	echo "=========================================="
	time sudo apt-get install cmake
	echo "=========================================="
	time sudo apt-get install gcc -qq
	time sudo apt-get install g++ -qq
	echo "=========================================="
    time sudo apt-get install gfortran -qq
    echo "=========================================="
    echo "Installing valgrind"
    sudo apt-get install valgrind -qq
    rm valgrind.log*
    echo "=========================================="
	echo "${CXX} will be your compiler"
	CXX="g++";
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

#Call functions

license_statement
#install_MPI
install_trusty_dep
install_PETSc
exit 0
