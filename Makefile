CFLAGS=-Wall -g

travis:
	bash src/ci_build.sh
main:
	bash src/run_main.sh
tests: 
	bash src/run_tests.sh
cirun:
	bash src/ci_run.sh
