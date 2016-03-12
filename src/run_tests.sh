# Detects operating system type, runs preferred compiler,
# executes tests, and cleans up.

if [ $OSTYPE = "linux-gnu" ]; then CXX="g++"; 
else CXX="clang++"
fi

echo
echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
echo "                           Running Catch tests                          "
echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
echo 

${CXX} src/catchDef.cpp src/tests.cpp src/approx.cpp src/add.cpp -o bin/tests
./bin/tests
rm "bin/tests"
