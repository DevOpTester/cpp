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

${CXX} src/main.cpp src/approx.cpp src/add.cpp -o bin/main
echo "Compiled. Now run:"
./bin/main
echo "End of run"
rm "bin/main"
echo "Files cleaned up"
