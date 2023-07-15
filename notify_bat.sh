#!/bin/bash


case $1 in
	battery)
		show_battery_notif
		;;
	volume)
		show_volume_notif
		;;
	brightness)
		show_brightness_notif
		;;
esac

