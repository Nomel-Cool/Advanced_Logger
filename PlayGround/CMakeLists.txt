cmake_minimum_required(VERSION 3.10)

project(Compiler_Root)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_C_COMPILER /usr/bin/gcc)

set(CMAKE_CXX_COMPILER /usr/bin/g++)

add_subdirectory(cpps) #'cpp' is in the same path of CMakeLists.txt
