#!/bin/bash

for dir in `find . -maxdepth 1 -type d -name "movie*"`
do
    echo $dir
    cd $dir
    ./gradlew bootRepackage
    cd ..
done
