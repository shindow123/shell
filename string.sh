#!/bin/bash

while read A
do
	echo $A
	echo ${#A}
	if [[ $A = "已绑定" ]];
	then
		echo 匹配成功
	fi
done < string.txt
