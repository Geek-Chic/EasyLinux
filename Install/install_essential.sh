#!/bin/bash
# Description: Some install and config scripts
# Author: Evil

install_essential(){
  install_openssh
  install_vim
}
#安装openssh
install_openssh(){
  yum -y install openssh-clients
}
#安装vim
install_vim(){
  yum -y install vim
}
install_command=("install_openssh
install_vim
install_essential
")
install_desc=('install_openssh 
install_vim 
install_essential_software')
#显示选择菜单界面
display_menu_with_desc install
