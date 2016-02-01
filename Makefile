CFLAGS=-Wall -g

all:
	g++ cpptest.cpp -o cpptest
clean:
	rm -f cpptest
