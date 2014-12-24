#!/bin/bash
# Description: Some install and config scripts
# Author: Evil

install_essential(){
  yum -y install openssh-clients
  yum -y install vim
}

install_command=("install_essential")
install_desc=('install_essential_software');
display_menu_with_desc install
