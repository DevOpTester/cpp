#!/bin/sh


# following function install_MPI() adapted from https://github.com/mpi4py/mpi4py/blob/master/conf/travis/install-mpi.sh
#Author: Lisandro Dalcin
#Contact:   dalcinl@gmail.com
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
            cd $HOME/mpich3.2-install/
            ./configure CC=gcc CXX=g++ F77=gfortran FC=gfortran --prefix=$HOME/mpich3.2-install --enable-fast make make install;;
            cd $HOME
        openmpi) set -x;
            sudo apt-get install openmpi-bin openmpi-dev
            export PATH=$HOME/mpich3.1-install/bin:$PATH;;
        *)
            echo "Unknown MPI implementation:" $1; exit 1;;
    esac
}

install_MPI
