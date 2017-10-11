#!/bin/bash  
trash_dir="$HOME/.trash"  
date=`date "+%Y%m%d"`  
mkdir -p ${trash_dir}/${date}  
for i in $*  
do  
    suffix=`date "+%H%M%S"`  
    if [ ! -d "${i}" ]&&[ ! -f "${i}" ]  
    then  
        echo "[${i}] do not exist"  
    else  
        file_name=`basename $i`  
		path_name=${trash_dir}\/${date}
		trash_name=${path_name}\/${file_name}_${suffix}_${RANDOM}
#		mkdir $path_name
        mv $i $trash_name  
		echo "[${i}] delete  completed ($trash_name)"  
    fi  
done  
