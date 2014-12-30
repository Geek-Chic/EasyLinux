#!/bin/bash

# File Name:update-submodules.sh
# Description: update submodules
# @Author: evil
# Created Time:Fri 29 Dec 2014 08:25:09 PM CST

grep path ./.gitmodules | awk '{ print $3 }' > /tmp/study-git-submodule-dirs
 
# read
while read LINE
do
    echo $LINE
    (cd ./$LINE && git checkout master && git pull)
done < /tmp/study-git-submodule-dirs