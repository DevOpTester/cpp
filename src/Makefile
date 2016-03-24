CFLAGS=-Wall -g

travis:
	bash ci_build.sh
main:
	bash run_main.sh
tests: 
	g++ catchDef.cpp tests.cpp approx.cpp add.cpp -o tests
	./tests
cirun:
	bash ci_run.sh
