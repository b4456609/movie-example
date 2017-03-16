#!/bin/bash

for dir in `find . -maxdepth 1 -type d -name "movie*"`
do
    echo $dir
    cd $dir
    if [ -f unitTest.sh ]; then
        sh ./unitTest.sh
    fi
    cd ..
done
