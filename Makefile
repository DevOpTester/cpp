CFLAGS=-Wall -g

travis:
	bash travis_build.sh
main:
	bash run_main.sh
tests: 
	bash run_tests.sh
