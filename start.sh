#!/bin/bash
#==============================================================
# SYSTEM REQUIRED: Ubuntu  CentOS Mac
# DESCRIPTION: automatic deploy and manager your server
# AUTHOR EVIL
#==============================================================

ROOT_DIR=`pwd`
FRAMEWORK=$ROOT_DIR/Lib/framework
if [ -f $FRAMEWORK ]; then
    . $FRAMEWORK
else
    echo "Error: can not find framework.sh"
    exit 0
fi
load_function Config
load_function Lib
load_function ${MODULE}
main_command=("dexec#Install/main.sh")
main_desc=('Install')
display_menu_with_desc main noback
