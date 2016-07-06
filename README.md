Testing out Jenkins for a C++ project.

Waffle Board: [![Stories in Ready](https://badge.waffle.io/DevOpTester/cpp.svg?label=ready&title=Ready)](http://waffle.io/DevOpTester/cpp)

Using GitHub Pull Request Builder plugin

Tried out Catch -- 
https://github.com/philsquared/Catch
I have currently abandoned it in favor of Google Test for jUnit xml output compatability (https://github.com/google/googletest/blob/master/googletest/docs/Primer.md)

Currently working on splitting out configuration, compilation running unit tests into seperate jobs on Jenkins and seeing how to set seperate commit statuses for each step.

See issues or waffle board for more information!


Notes: to create xml report of results with gtest, run test executable with --gtest_output="xml:${path to output file
here}" Note that it will not overwrite a file if it allready exists, it will append a number to the end of the filename.
