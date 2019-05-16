MAPTest
=======

### MAP-Coverage: a Novel Coverage Criterion for Testing Thread-Safe Classes

#### Introduction

​	In this work, we introduce a novel code coverage criterion for testing thread-safe classes called MAP-coverage (short for memory-access patterns).  And MAPTest is designed to achieve high MAP-Coverage.

​	MAPTest is a tool for detecting errors in Java thread-safe classes. Generate test cases by analyzing potential error Memory Access Patterns to trigger errors in thread-safe classes.  

#### Getting Started

Environment

* Install JDK 1.8.0

* Install Scala-Sdk-2.10.4

Run

> cd MAPTest
>
> ./script/MAPTest.sh MAPTest

#### Directory description
* Benchmarks : contains all our test programs.
* lib/ownLibs : jar packages used in MAPTest
* map：MAPTest program jar（source code will come soon…）
* results：save the test results of the program
*  scripts: Program scripts, you can modify the relevant experiment settings in MAPTest.sh.

#### Reference tools

* [ASM](<https://asm.ow2.io/>)
* [ConTeGe](<https://github.com/michaelpradel/ConTeGe>)
* [CovCon](<https://github.com/michaelpradel/ConTeGe/tree/CovCon>)