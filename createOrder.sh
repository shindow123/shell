#!/bin/bash
for j in {1..1}
do
	let base_orderId=201811011315150${j}00
	sql="INSERT INTO order.user_order
	(orderId,
	pid,
	uid,
	corpId,
	sharePriceE6,
	shareCount,
	totalPriceE6,
	repayBankCardId,
	transactionId,
	incomeBeginTime,
	incomeEndTime,
	expectIncomeE6,
	name,
	isAnonymous,
	payState,
	incomeState,
	orderState,
	createTime,
	updateTime,
	payCode,
	subscriptionFeeE6,
	serviceFeeE6,
	totalAmtE6,
	orderType,
	mortgageState,
	pzId,
	payType)
	VALUES"
	for i in {1..1}
do
	let orderId=$base_orderId+$i;
	echo $orderId;
	row="($orderId, 10087, 101608, 1, 1000000, 1000, 1000000000, 640, '__direct_set_order_paid__', 1421514061, 1449849600, 2000000000,'KakaTest',1,2,4,0,1425456747,1425456947,'',0,0,1000000000,8,1,'',0)"
	sql="$sql$row,"
done
sql=${sql%?}
echo $sql
mysql -h10.21.200.75  -ugeneral    -pdb@yijie -e "$sql"
done

#INSERT INTO `order`.`user_order`
#(`orderId`,
#`pid`,
#`uid`,
#`corpId`,
#`sharePriceE6`,
#`shareCount`,
#`totalPriceE6`,
#`repayBankCardId`,
#`transactionId`,
#`incomeBeginTime`,
#`incomeEndTime`,
#`expectIncomeE6`,
#`name`,
#`isAnonymous`,
#`payState`,
#`incomeState`,
#`orderState`,
#`createTime`,
#`updateTime`,
#`payCode`,
#`subscriptionFeeE6`,
#`serviceFeeE6`,
#`totalAmtE6`,
#`orderType`,
#`mortgageState`,
#`pzId`,
#`payType`)
#VALUES
#(
#
#);

