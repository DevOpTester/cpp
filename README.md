Testing out CI platforms for a C++ project.

travis-ci.org --> [![Build Status](https://travis-ci.org/deleeke/testingCPP.svg?branch=master)](https://travis-ci.org/deleeke/testingCPP)

semaphoreci.com --> [![Build Status](https://semaphoreci.com/api/v1/deleeke/testingcpp/branches/master/badge.svg)](https://semaphoreci.com/deleeke/testingcpp)

Trying Catch -- 
https://github.com/philsquared/Catch


/*****************************************************************************************************************
                            
                                         # TODO


#### Catch
   - [x] Create simple TEST_CASE () that tests if a function returns expected value
   - [ ] Make use of multiple SECTION () functions within a TEST_CASE ()
   - [ ] Make use of tags for hiding tests [.]
   - [ ] Create test case that loads external data and runs tests against it
   - [ ] Build set of tests in BDD style  (SCENARIO() --> WHEN() --> THEN())


#### Travis
  Goal : implement method that installs correct dependencies for os type and compiles and runs tests without human
  * :thumbsdown: ~~Method 1: only use .travis.yml to execute commands~~   *too clunky and not portable* 
  * :point_right: Method 2: create bash script that detects os type, selects compiler and executes commands 
    - Linux:
       - working (within current bounds)
    - osx:
      - not yet working    *(need to consult with osx user)*

#### Semaphore
  - same goals as travis-ci
  - compare preformance and interface with travis

********************************************************************************************************************/
  
  
                            
