#!/usr/bin/env bash

while true
do
	clear
	if [ -f "/sys/kernel/debug/mmc3/ios" ]; then
		cat /sys/kernel/debug/mmc3/ios
	fi
	sleep 1
done

