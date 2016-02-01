CFLAGS=-Wall -g

gcompile:
	g++ cpptest.cpp -o cpptest
clangcompile:
	clang++ cpptest.cpp -o cpptest
clean:
	rm -f cpptest
