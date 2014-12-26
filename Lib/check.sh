#!/bin/bash

# File Name:check.sh
# Description:
# @Author: evil
# Created Time:Fri 26 Dec 2014 08:25:09 PM CST
echo "Checking System Information"
check_system_info(){
    if which apt-get > /dev/null; then
        SYSTEM="ubuntu"
        cat /proc/cpuinfo
    elif which yum > /dev/null; then
        SYSTEM="centos"
    fi
}
