#!/bin/bash 
#Description: Config file
#Author: evil

###全局变量
ROOT_DIR=`pwd`
RES=${ROOT_DIR}/Res
CONFIG=${ROOT_DIR}/Config


##163源
REPO_163="http://mirrors.163.com/.help/CentOS6-Base-163.repo"

config_test(){
    echo "resource dir:${RES}"
    echo "config dir:${CONFIG}"
}
