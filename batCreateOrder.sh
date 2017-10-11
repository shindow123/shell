#!/bin/bash

#ids=(
#201510201709490264
#)
#
#ids2=(
#	201406231814442271
#	201406231814435834
#)
#
#
##for((i=1;i<=10;i++));do echo $ids;done
#for i in ${ids[@]}
#do 
#	cmd="./test_cancelOrder.bin '{\"req\":{\"orderId\":\"$i\",\"manualCode\":\"HundredUserCaiFuPai\"}}' 127.0.0.1 19092" 
#	echo $cmd
#	eval $cmd
#	#./test_cancelOrder.bin '{"req":{"orderId":"{$i}"}}'  127.0.0.1 19092
#	#./test_cancelOrder.bin '{"req":{"orderId":"201406231814442271"}}' 127.0.0.1 19092
#
#done


OLDIFS="$IFS"
IFS=,
echo pid uid shareCnt mobile cardNo province city bank bindCard
while read pid uid shareCnt mobile cardNo province city bank bindCard 
do
	BINDCARD="true"
	CARDINFO=""

	if [[ $bindCard = "已绑定" ]];then
		BINDCARD="true"
	elif [[ $bindCard = "未绑定" ]];then
		BINDCARD="false"
		CARDINFO=",\"province\":\"$province\",\"city\":\"$city\",\"bank\":\"$bank\""
	else
		echo 绑定状态错误
		echo $pid $uid $shareCnt $mobile $cardNo $province $city $bank $bindCard
		continue
	fi

	cmd="./test_createOrderByManual.bin '{\"req\":{\"pid\":\"$pid\",\"uid\":$uid,\"shareCount\":$shareCnt,\"originalCardNo\":\"$cardNo\",\"manualCode\":\"HundredUserCaiFuPai\",\"needBindCard\":$BINDCARD$CARDINFO}}'"
	echo "$cmd"
	eval "$cmd"
done <  createorder.csv
IFS="$OLDIFS"
