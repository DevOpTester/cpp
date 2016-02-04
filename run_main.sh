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

${CXX} main.cpp add.cpp -o add
echo "Compiled. Now run:"
./add 
echo "End of run"
rm "add"
echo "Files cleaned up"
