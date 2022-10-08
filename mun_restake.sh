#!/bin/bash
for (( ;; )); do
	echo -e "\033[0;32mCollecting rewards!\033[0m"
	mund tx distribution withdraw-rewards munvaloper1h0lyxl34zdxpdmz67a2t0jsyteu9gy4yu4m2yt --commission --from mjhmojthu --chain-id testmun -y 
	echo -e "\033[0;32mWaiting 30 seconds before requesting balance\033[0m"
	sleep 30
	AMOUNT=$(mund q bank balances mun1h0lyxl34zdxpdmz67a2t0jsyteu9gy4yl0zj72 | grep amount | awk '{split($0,a,"\""); print a[2]}')
	AMOUNT=$(($AMOUNT - 5000))
	AMOUNT_STRING=$AMOUNT"utmun"
	echo -e "Your total balance: \033[0;32m$AMOUNT_STRING\033[0m"
	 mund tx staking delegate munvaloper1h0lyxl34zdxpdmz67a2t0jsyteu9gy4yu4m2yt $AMOUNT_STRING --from mjhmojthu --chain-id testmun -y
	echo -e "\033[0;32m$AMOUNT_STRING staked! Restarting in 3600 sec!\033[0m"
	sleep 7200
done
