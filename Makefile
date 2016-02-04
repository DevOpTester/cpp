CFLAGS=-Wall -g

travis:
	bash ci_build.sh
main:
	bash run_main.sh
tests: 
	bash run_tests.sh
