#!/bin/sh
MYDATE=`date +%y-%m-%d`
THIS_HOST=`hostname -s`
USER=`whoami`
while true
do
  tput clear
echo -e "`cat <<EOF
-------------------------------------------------
               Linux 软件安装
User:$USER    HOST:$THIS_HOST    Date:$MYDATE
-------------------------------------------------
1、查看系统信息
2、自动安装
3、自定义安装
H、帮助
Q、退出
-------------------------------------------------
EOF`"
echo -n "请选择操［1,2,3,H,Q］:"
read CHOICE
 case $CHOICE in
1)
  uname -a
  cat /etc/lsb-release
  read STOP
;;
2)
echo -e "`cat <<MARK
-----------------------------------------------
安装基本类库：
1、apt-get install build-essential
   apt-get install debian-keyring debian-archive-keyring

安装必备插件：
1、flash、ffpmeg

将要安装的软件
1、bumblebee 关掉独显
  PPA：sudo add-apt-repository ppa:bumblebee/stable
  Install：
 12.04～13.04：sudo apt-get install bumblebee bumblebee-nvidia virtualgl linux-headers-generic
 13.10：sudo apt-get install bumblebee bumblebee-nvidia primus linux-headers-generic
 URL：https://wiki.ubuntu.com/Bumblebee#Installation

2、google-chrome-stable
 wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
 sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
 Install:sudo apt-get install google-chrome-stable
 URL:http://www.google.com/linuxrepositories/

  3、fcitx
   PPA:sudo add-apt-repository ppa:fcitx-team/nightly
   Install:sudo apt-get install fcitx-sogoupinyin fcitx-table-wbpy
   Skin:http://pan.baidu.com/s/1qW2NyR6 
      复制至/usr/share/fcitx/skin中

4、VirtualBox
 KEY:wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
 PPA:sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib" > /etc/apt/sources.list.d/virtualbox.list'
 INSTALL:sudo apt-get install virtualbox-4.3

 5、WPS
 LIB: sudo apt-get install ia32-libs
      sudo apt-get install libc6-i386  
  DOWNALOD:http://community.wps.cn/download/

6、Indicator-Sysmonitor
 sudo add-apt-repository ppa:alexeftimie/ppa 
 install:sudo apt-get install indicator-sysmonitor dstat
 Preference:
  mkdir -p ~/.scripts && cd ~/.scripts
  wget http://webupd8.googlecode.com/files/sysmon_0.2.tar.gz && tar -xvf sysmon_0.2.tar.gz

7、Nmap RPM安装
 安装alien:sudo apt-get install alien
 转化为deb:sudo alien 
 下载地址：http://nmap.org/download.html
 安装nmap:sudo dpkg --install nmap_6.40-2_amd64.deb 
 安装依赖：sudo apt-get install subversion
 添加软件链接:sudo ln -s /usr/lib/x86_64-linux-gnu/libsvn_client-1.so.1 /usr/lib/libsvn_client-1.so.0

 8、Xclip
 安装:sudo apt-get install xclip
 使用复制至剪切板：cat xx | xclip -selection clipboard

 9、audio-recorder
 PPA:sudo add-apt-repository ppa:osmoma/audio-recorder
 INSTALL:sudo apt-get install audio-recorder

 10、为知笔记
 PPA:sudo add-apt-repository ppa:wiznote-team
 INSTALL:sudo apt-get install wiznote

 开发使用的软件
 1、Python3
 源码安装：http://www.python.org/ftp/python/3.3.4/Python-3.3.4.tgz
 readline: sudo apt-get install libreadline6 libreadline6-dev(解决方向键问题)
 安装：
 tar -xzvf Python-3.3.4.tgz && cd Python-3.3.4
 sed 's/#readline/readline/' Modules/Setup.dist > TMPFILE && mv TMPFILE Modules/Setup.dist
./configure --prefix=/home/local/python3 && make && make install
 mv /usr/bin/python /usr/bin/python_old
ln /usr/local/python3/bin/python3 /usr/bin/python

2、PHP Pear安装
下载获取：curl -o go-pear.php  http://pear.php.net/go-pear.phar
 cd /usr/local/php/etc
 安装sudo /usr/local/php/bin/php go-pear.php

MARK`"
echo "按任意键开始安装。。。。"
read STOP
echo "开始导入PPA"
sudo add-apt-repository ppa:bumblebee/stable
sudo add-apt-repository ppa:fcitx-team/nightly
sudo add-apt-repository ppa:alexeftimie/ppa 

#更新PPA和系统软件
sudo apt-get update
sudo apt-get upgrade
#安装Vim代替Vi
sudo apt-get install --force-yes -y vim
echo "alias vi=vim" >> ~/.bashrc
source ~/.bashrc
#安装压缩类软件
sudo apt-get install p7zip-full p7zip-rar unace unrar sharutils rar --force-yes -y
#安装系统软件
echo "正在安装alien，RPM转换Deb工具"
sudo apt-get install alien --force-yes -y
echo "正在安装xclip"
sudo apt-get install xclip --force-yes -y

;;
3)
;;
h)

;;
q)
exit 0
;;
esac
done
