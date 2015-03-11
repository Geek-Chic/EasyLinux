EasyLinux
=========
evilester@sina.com

http://evilester.github.com

-------------------------
##[EasycLinux]
EasycLinux是轻量级的Shell编程框架，其目的是提高我们使用Linux的效率，减少不断重复的配置，安装操作，并可以轻易的实现自己的扩展。
支持系统：Mac,Centos,Ubuntu(其它Linux环境未做使用测试，需要对程序做相应的修改)
##[Version]
-------------------------
v0.1.0 14 Dec 2014 初始版本

##[Install]
-------------------------
```
  git clone https://github.com/Geek-Chic/EasyLinux.git
  ./easyc -u //安装
  配置环境变量
  export EASYC_HOME=/path/to/EasyLinux
  ec -h 查看帮助
```
```
    ec -- easy for linux and mac
    USAGE:easyc [-m] module [-t] target

    OPTIONS:
    -d,--daemon       Execute <cmd> as a screen command in the specified session
    -v,--version      Display version information
    -m module         Specified Target Module
    -t target         Specified Target
    -h,--help         Display help information
    -x,--xdebug       Display debug information
    -u,--update       Update ec command
    EXAMPLE:ec -m install -t main/ec install main
    This will exec install/main.sh
```
##[Developer]
###文件结构
* Bin Script 脚本
* Config
   -- config.zz 全局配置文件
   -- local.zz.sample 本地配置文件
* Lib 框架库
* Module 模块库
   -- Centos Centos脚本
   -- Macos  Macos 脚本
   -- Ubuntu Ubuntu脚本
   -- Script 公共脚本
* Res 资源文件
* Soft 安装过程中下载的软件
* Submodule 子模块
* Tmp 运行过程中的缓存日志文件
* easyc 命令运行主程序
* start 界面运行主程序
###特殊文件格式
.zz 格式是我们函数定义格式，会被框架自己动加载
###运行流程
当运行ec命令时，会加载Config,Lib,和Module下对应系统的脚本
###扩展
只要在相应模块下创建.zz格式的shell脚本，实现自己的函数即可
调用ec -x表示以debug格式运行

##[LINKS]


 