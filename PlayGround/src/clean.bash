#!/bin/bash

# 删除除了build.bash, bison_template.y, flex_template.l, clean.bash以外的所有文件
find . -type f ! -name 'build.bash' ! -name 'bison_template.y' ! -name 'flex_template.l' ! -name 'clean.bash' -delete

# 删除所有的子文件夹
find . -mindepth 1 -type d -exec rm -rf {} +
