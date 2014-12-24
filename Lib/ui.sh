#!/bin/bash
# Descripton: menu
# Author: Evil

MYDATE=`date +%y-%m-%d`
THIS_HOST=`hostname -s`
USER=`whoami`

#显示菜单(单选)
display_menu(){
local soft=$1
local prompt="which ${soft} you'd select: "
eval local arr=(\${${soft}_arr[@]})
while true
do
	echo -e "#################### ${soft} setting ####################\n\n"
	for ((i=1;i<=${#arr[@]};i++ )); do echo -e "$i) ${arr[$i-1]}"; done
	echo
	read -p "${prompt}" $soft
	eval local select=\$$soft
	if [ "$select" == "" ] || [ "${arr[$soft-1]}" == ""  ];then
		prompt="input errors,please input a number: "
	else
		eval $soft=${arr[$soft-1]}
		eval echo "your selection: \$$soft"             
		break
	fi
done
}

#显示菜单(多选)
display_menu_multi(){
local soft=$1
local prompt="please input numbers(ie. 1 2 3): "
eval local arr=(\${${soft}_arr[@]})
local arr_len=${#arr[@]}

echo  "#################### $soft install ####################"
echo
for ((i=1;i<=$arr_len;i++ )); do echo -e "$i) ${arr[$i-1]}"; done
echo
while true
do
	read -p "${prompt}" select
	local select=($select)
	eval unset ${soft}_install
	unset wrong
	for j in ${select[@]}
	do
		if (! echo $j | grep -q -E "^[0-9]+$") || [[ $j -le 0 ]] || [[ $j -gt $arr_len ]];then
			prompt="input errors,please input numbers(ie. 1 2 3): ";
			wrong=1
			break
		elif [ "${arr[$j-1]}" == "do_not_install" ];then
			eval unset ${soft}_install
			eval ${soft}_install="do_not_install"
			break 2
		else
			eval ${soft}_install="\"\$${soft}_install ${arr[$j-1]}\""
			wrong=0
		fi
	done
	[ "$wrong" == 0 ] && break
done
eval echo -e "your selection \$${soft}_install"
}
#显示菜单，自定义显示菜单条目
display_menu_with_desc(){
local soft=$1
local prompt="which ${soft} you'd select: "
eval local command=(\${${soft}_command[@]})
eval local desc=(\${${soft}_desc[@]})
while true
do
        echo -e "----------------------------------------------------"
	echo -e "                    ${soft} MENU                    "
        echo -e "User:${USER}    HOST:${THIS_HOST}    Date:${MYDATE} "
        echo -e "----------------------------------------------------"
	for ((i=1;i<=${#desc[@]};i++ )); do echo -e "$i) "`decode_str ${desc[$i-1]}`; done
        echo -e "----------------------------------------------------"
	echo
	read -p "${prompt}" $soft
       
	eval local select=\$$soft
	if [ "$select" == "" ] || [ "${command[$soft-1]}" == ""  ];then
		prompt="input errors,please input a number: "
	else
		cod=`decode_str ${command[$soft-1]}` 
                eval $cod
		break
	fi
done
}
#去掉字符串中的分隔符"#",替换为空格
decode_str(){
 echo $1 | tr '#' ' ' | tr -s ' '
}
