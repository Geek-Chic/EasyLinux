#!/bin/bash
# Description: Some install and config scripts
# Author: Evil

CURRENT_PATH=`pwd`
install_zsh(){
  . func/zsh 
}
install_command=("install_zsh
")
install_desc=('install_zsh')
#显示选择菜单界面
display_menu_with_desc install
