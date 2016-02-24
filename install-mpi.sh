#!/bin/sh
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
    ./configure CC=gcc CXX=g++ F77=gfortran FC=gfortran --prefix=$HOME/mpich3.2-install --enable-fast make make install;;
  openmpi) set -x;
    sudo apt-get install openmpi-bin openmpi-dev
    export PATH=$HOME/mpich3.1-install/bin:$PATH;;
  *)
    echo "Unknown MPI implementation:" $1; exit 1;;
esac
