# Detects operating system type and installs dependencies,
# then compiles and runs tests and compiles and runs main. 

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
	echo "yes" | sudo add-apt-repository ppa:plfiorini/cmake ;
	#https://wiki.ubuntu.com/ToolChain
	echo "yes" | sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
	sudo apt-get update -qq
	sudo apt-get install cmake
	sudo apt-get install gcc-4.8 g++-4.8 -qq
#	sudo apt-get upgrade -qq
	echo "${CXX} will be your compiler"
	CXX="g++";
	fi
}

function install_osx_dep()
{
	if [ $OSTYPE != "linux-gnu" ]; then CXX="clang++"
	brew update 
	echo "yes" | brew install llvm --with-clang; 
	fi
}

function run_tests()
{
	if [ $OSTYPE == "linux-gnu" ]; then CXX="g++"; 
	else CXX="clang++"
	fi
	echo
	echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
	echo "                         Running Catch tests                          "
	echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
	echo 

	${CXX} catchDef.cpp tests.cpp montecarolopi.cpp add.cpp -o tests
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

	${CXX} main.cpp montecarlopi.cpp add.cpp -o add
	echo "Compiled. Now run main:"
	./add 
	echo "End of run"
	rm "add"
	echo "Files cleaned up"
}

#Call functions

license_statement
install_trusty_dep
install_osx_dep
run_tests
run_main
exit 0
