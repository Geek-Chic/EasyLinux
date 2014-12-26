#!/bin/bash

# File Name:test.sh
# Description:
# @Author: evil
# Created Time:Fri 26 Dec 2014 08:44:11 PM CST

ROOT_DIR=`pwd`
#加载框架函数
FRAMEWORK=$ROOT_DIR/Lib/framework
if [ -f $FRAMEWORK ]; then
    . $FRAMEWORK
else
    echo "Error: can not find framework.sh"
    exit 0
fi
load_function Config Gen
load_function Lib Gen
echo "-------------------- Test Info ----------------------"
echo "root dir:${ROOT_DIR}"
echo "system:${SYSTEM}"
config_test

