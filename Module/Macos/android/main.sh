#!/bin/bash

# File Name:main.sh
# Description: Android Control Menu
# @Author: evil
# Created Time:Sat 27 Dec 2014 01:17:06 PM CST


android_command=("http_tcpdump http_tcpdump")
android_desc=("挂载system为只读
tcpdump抓包至/sdcard/capture.pcap
")
#显示选择菜单界面
display_menu_with_desc android
