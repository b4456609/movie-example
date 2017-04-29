#!/bin/bash

for dir in `find . -maxdepth 1 -type d -name "movie*"`
do
    echo $dir
    cd $dir
    if [ -f unitTest.sh ]; then
        curl -i -X POST \
            -H "Content-Type: multipart/form-data" \
            -F "file=@./build/mca/mpd.json" \
            http://$MGP/api/upload
    fi
    cd ..
done
