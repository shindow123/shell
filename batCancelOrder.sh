#/bin/bash!


ids=(
201510201709490264
)

ids2=(
	201406231814442271
	201406231814435834
)


#for((i=1;i<=10;i++));do echo $ids;done
for i in ${ids[@]}
do 
	cmd="./test_cancelOrder.bin '{\"req\":{\"orderId\":\"$i\",\"manualCode\":\"HundredUserCaiFuPai\"}}' 127.0.0.1 19092" 
	echo $cmd
	eval $cmd
	#./test_cancelOrder.bin '{"req":{"orderId":"{$i}"}}'  127.0.0.1 19092
	#./test_cancelOrder.bin '{"req":{"orderId":"201406231814442271"}}' 127.0.0.1 19092

done

