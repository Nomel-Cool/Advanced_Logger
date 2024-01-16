#!/bin/bash

# 删除除了build.bash, bison_template.y, flex_template.l, clean.bash以外的所有文件
find . -type f ! -name 'clean.bash' ! -name 'cf.lex.cpp' ! -name 'cf.tab.cpp' ! -name 'cf.tab.hpp' ! -name 'CMakeLists.txt' -delete

# 删除所有的子文件夹
find . -mindepth 1 -type d -exec rm -rf {} +
