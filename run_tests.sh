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

${CXX} catchDef.cpp tests.cpp add.cpp -o tests
./tests -s
rm "tests"
