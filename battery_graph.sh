#!/bin/bash

battery="/sys/class/power_supply/BAT1"
last_charge=-1

touch bat.txt

while true; do
	charge=$(cat $battery/capacity)
	if [ $charge -ne $last_charge ]; then
		last_charge=$charge
		echo "$(date | awk '{print $4$5}') -> $charge">>bat.txt
	fi
done

