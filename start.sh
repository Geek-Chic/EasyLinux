#!/bin/bash
#==============================================================
# SYSTEM REQUIRED: LINUX
# DESCRIPTION: automatic deploy and manager you linux server
# AUTHOR EVIL
#==============================================================


CURRENT_DIR=`pwd`

#调用函数
load_function(){
  local model=$1
for file in ${model}/*
do
  local shfile=$CURRENT_DIR/${file}
  if [ -s ${shfile} ] &&  [ ${file##*.} = 'sh' ]
  then 
      echo "exec file ${file}"
      . ${shfile}
  fi 
done
}
load_function Lib 
load_function Install
