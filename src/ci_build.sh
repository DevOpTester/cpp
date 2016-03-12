#!/bin/sh
# Installs PETSc, MPI, and more

function license_statement()
{
    echo
    echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
    echo
    echo "                  Copyright (C) 2016 Elijah DeLee"
    echo "                  Licensed under the MIT License."
    echo "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED"
    echo "         See the file LICENSE.txt for the full license text."
    echo
    echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
    echo
}

function install_trusty_dep()
{
    CXX="g++";
    C="gcc";
    FC="gfortran";
    echo
    echo "Installing dependencies for Ubuntu 14.04";
    echo
    sudo apt-get update -y
    echo "Installing valgrind"
    sudo apt-get install valgrind -y
    sudo apt-get install cmake -y
    sudo apt-get install libreadline6 -y
    sudo apt-get install gcc -y
    sudo apt-get install g++ -y
    sudo apt-get install gfortran -y
    echo "$CXX will C++ be your compiler"
    echo "$C will be your C compiler"
    echo "$FC will be your fortran compiler"
    
}

function install_HDF5()
{
  mkdir $HOME/sfw/linux/hdf5
  cd $HOME/sfw/linux/hdf5
  wget http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.16.tar
  tar xvfz hdf5-1.8.16.tar.gz
  cd hdf5-1.8.16
  ./configure \
    CC=gcc \
    CXX=g++ \
    FC=gfortran \
    F77=gfortran \
    --enable-production \
    --disable-debug \
    --prefix=$HOME/sfw/linux/hdf5/1.8.16
  make
  make check
  make install
  export HDF5_DIR=$HOME/sfw/linux/hdf5/1.8.16
}


function install_SILO()
{
  # Download and install Silo 4.10
  cd $HOME/sfw/linux/
  mkdir silo
  cd silo
  
  wget https://wci.llnl.gov/content/assets/docs/simulation/computer-codes/silo/silo-4.10/silo-4.10.tar.gz

  tar xvfz silo-4.10.tar.gz
  export SILO_DIR=$HOME/sfw/linux/silo/silo-4.10
  cd silo-4.10
  ./configure \
    CC=gcc \
    CXX=g++ \
    FC=gfortran \
    F77=gfortran \
    --prefix=$HOME/sfw/linux/silo/4.10 \
    --disable-silex
  make
  make install
  export SILO_DIR=$HOME/sfw/linux/silo/4.10
}

function install_OpenMPI()
{
  cd $HOME/sfw/linux/
  wget https://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.2.tar.bz2
  tar xvfj openmpi-1.10.2.tar.bz2
  cd openmpi-1.10.2
  ./configure \
    CC=gcc \
    CXX=g++ \
    FC=gfortran \
    F77=gfortran \
    --prefix=$HOME/sfw/linux/openmpi/1.10.2 \
    --disable-mpi-cxx-seek \
    --disable-heterogeneous \
    --enable-orterun-prefix-by-default
  make
  make check
  make install
  export MPI_DIR=$HOME/sfw/linux/openmpi/1.10.2
}

function install_PETSc()
{
  git clone -b maint https://bitbucket.org/petsc/petsc $HOME/sfw/petsc
  cd $HOME/sfw/petsc/
  export PETSC_DIR=$HOME/sfw/petsc/
  export PETSC_ARCH=linux-dbg
  ./config/configure.py \
    --CC=$HOME/sfw/linux/openmpi/1.8.2/bin/mpicc \
    --CXX=$HOME/sfw/linux/openmpi/1.8.2/bin/mpicxx \
    --FC=$HOME/sfw/linux/openmpi/1.8.2/bin/mpif90 \
    --LDFLAGS="-L$MPI_DIR/lib -Wl,-rpath,$MPI_DIR/lib" \
    --PETSC_ARCH=$PETSC_ARCH \
    --with-shared-libraries \
    --download-hypre
  make
  make test
 
  export PETSC_DIR=$PWD
  export PETSC_ARCH=linux-opt
  ./config/configure.py \
    --CC=$MPI_DIR/bin/mpicc \
    --CXX=$MPI_DIR/bin/mpicxx \
    --FC=$MPI_DIR/bin/mpif90 \
    --LDFLAGS="-L$MPI_DIR/lib -Wl,-rpath,$MPI_DIR/lib" \
    --PETSC_ARCH=$PETSC_ARCH \
    --with-shared-libraries \
    --with-debugging=0 \
    --with-x=0 \
    --download-hypre
  make
  make test
  
  cd $HOME 
} 

function install_SAMRAI()
{
  cd $HOME/sfw
  mkdir samrai
  cd samrai
  mkdir 2.4.4
  cd 2.4.4
  wget https://computation.llnl.gov/project/SAMRAI/download/SAMRAI-v2.4.4.tar.gz
  tar xvfz SAMRAI-v2.4.4.tar.gz
  wget https://github.com/IBAMR/IBAMR/releases/download/v0.1-rc1/SAMRAI-v2.4.4-patch-121212.gz
  cd SAMRAI
  ./source/scripts/includes --link
  gunzip -c ../SAMRAI-v2.4.4-patch-121212.gz | patch -p2
  
  cd $HOME/sfw/samrai/2.4.4
  mkdir objs-dbg
  cd objs-dbg
  ../SAMRAI/configure \
    --prefix=$HOME/sfw/samrai/2.4.4/linux-dbg \
    --with-CC=gcc \
    --with-CXX=g++ \
    --with-F77=gfortran \
    --with-MPICC=$MPI_DIR/bin/mpicc \
    --with-hdf5=$HDF5_DIR \
    --without-hypre \
    --with-silo=$SILO_DIR \
    --without-blaslapack \
    --without-cubes \
    --without-eleven \
    --without-kinsol \
    --without-petsc \
    --without-sundials \
    --without-x \
    --with-doxygen \
    --with-dot \
    --enable-debug \
    --disable-opt \
    --enable-implicit-template-instantiation \
    --disable-deprecated
  make
  make install
  
  cd $HOME/sfw/samrai/2.4.4
  mkdir objs-opt
  cd objs-opt
  ../SAMRAI/configure \
    CFLAGS="-O3" \
    CXXFLAGS="-O3" \
    FFLAGS="-O3" \
    --prefix=$HOME/sfw/samrai/2.4.4/linux-opt \
    --with-CC=gcc \
    --with-CXX=g++ \
    --with-F77=gfortran \
    --with-MPICC=$MPI_DIR/bin/mpicc \
    --with-hdf5=$HDF5_DIR \
    --without-hypre \
    --with-silo=$SILO_DIR \
    --without-blaslapack \
    --without-cubes \
    --without-eleven \
    --without-kinsol \
    --without-petsc \
    --without-sundials \
    --without-x \
    --with-doxygen \
    --with-dot \
    --enable-debug \
    --disable-opt \
    --enable-implicit-template-instantiation \
    --disable-deprecated
  make
  make install 
}

#Call functions

mkdir $HOME/sfw
mkdir $HOME/sfw/linux
license_statement
install_trusty_dep
install_HDF5
install_SILO
install_PETSc
install_SAMRAI
exit 0
