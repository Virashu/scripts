#!/bin/bash

temp=$(sensors acpitz-acpi-0 | grep -Po '[0-9]{1,3}(?=\.)' | head -1)
crit=$(sensors acpitz-acpi-0 | grep -Po '[0-9]{1,3}(?=\.)' | tail -1)

while true; do
	if [ $temp -gt 90 ]; then
		notify-send -t 5000 -u critical "The CPU is $temp°C hot!"
	fi
	sleep 60
done
