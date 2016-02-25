#!/bin/bash
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

${CXX} main.cpp approx.cpp  add.cpp -o main
echo "Compiled. Now run:"
./main
echo "End of run"
rm "main"
echo "Files cleaned up"
