#!/bin/bash

# 运行flex和bison命令
flex -o ../cpps/cf.lex.cpp flex_template.l
bison -d -o ../cpps/cf.tab.cpp bison_template.y

# Go bakc to /PlayGround/cpps, then complie cf.lex.cpp and cf.tab.cpp
cd ..
cd build
cmake ..
make
./bin/Compiler_Frontier > ./bin/ast.txt
