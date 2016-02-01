CFLAGS=-Wall -g

linuxcompile:
	g++ cpptest.cpp -o cpptest
osxcompile:
	clang++ cpptest.cpp -o cpptest
clean:
	rm -f cpptest
