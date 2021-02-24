#!/usr/bin/env bash

while true
do
	clear
	dd if=/dev/mmcblk3boot0 of=/dev/null bs=4M iflag=direct
	dd if=/dev/mmcblk3boot1 of=/dev/null bs=4M iflag=direct
	dd if=/dev/mmcblk3 of=/dev/null bs=100M count=1 iflag=direct
	echo
	read -p "Press enter to continue"
done
