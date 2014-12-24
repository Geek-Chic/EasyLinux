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

main_command=("load_function#Install")
main_desc=('install')
display_menu_with_desc main 
