#!/bin/bash



function killProc()
{
cmd="/$1.bin"
echo  $cmd 
ps -aux | grep "$cmd" | grep -v "grep" | awk '{print $2}' | while read line;  
do  
    kill -9 $line  
done  
}

function replaceBin()
{
binName=$1
path=$2
version=$3
cmd="ln -sf /data/release/server/dist/hsfund_server/$2repo/$1.bin.$3 $2$1.bin"
echo $cmd
eval $cmd
}

function restartProc()
{
cmd="$1admin.sh start"
echo $cmd
eval $cmd
}

function showProc()
{
cmd="./$1admin.sh status"
echo $cmd
eval $cmd
}

#版本号
if [ -z "$1" ];then
echo "please input version fileName [e.g. version_master]"
exit
else
echo "version file: $1"
fi

cat $1 | while read line
do
    echo "${line}"
    context=${line}
    bin=`echo $context | awk '{print $1}'`
    path=`echo $context | awk '{print $2}'`
    version=`echo $context | awk '{print $3}'`

    killProc $bin 
    replaceBin $bin $path $version
    restartProc $path 
done

#updateVer=$1
##结束进程
#killProc hsfund_server
#killProc entrust_consumer 
#killProc notify_consumer 
##killProc update_entrust_consumer 
#
##替换执行文件
#replaceBin hsfund_server $updateVer 
#replaceBin common_consumers/entrust_consumer/entrust_consumer $updateVer
#replaceBin common_consumers/notify_consumer/notify_consumer $updateVer
#replaceBin common_consumers/update_entrust_consumer/update_entrust_consumer $updateVer
#
##重启进程
#restartProc 
#restartProc common_consumers/entrust_consumer/
#restartProc common_consumers/notify_consumer/
#restartProc common_consumers/update_entrust_consumer/



