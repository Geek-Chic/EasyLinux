#!/bin/bash
# Description: Some install and config scripts
# Author: Evil

install_essential(){
  #安装openssh
  echo "正在安装openssh-client"
  yum -y install openssh-client
  echo "正在安装vim"
  yum -y install vim
}
install_zsh(){
  . Install/zsh
}
install_jdk(){
 echo "http://www.bbtang.info/linux/web/849.html" 
}
install_command=("install_essential install_zsh")
install_desc=("Install_essential(openssh#vim)
Install#Zsh 
")
#显示选择菜单界面
display_menu_with_desc install
