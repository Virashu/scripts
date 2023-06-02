#!/bin/bash

dir="/home/virashu/Pictures/screenshots"
dest="$dir/%Y-%m-%d-%s_\$wx\$h.jpg"


function get_last {
	find /home/virashu/Pictures/screenshots -maxdepth 1 -type f -printf '%T@ %p\n' | sort -k1,1nr | head -1 | awk '{print $2}'
	#find $dir -maxdepth 1 -type f | sort -k1,1nr | head -1
	#stat -c '%Y %n' $dir/* | sort -k1,1nr | head -1
}

case $1 in
	normal)
		/usr/bin/scrot -d0 "$dest"
		;;
	focused)
		/usr/bin/scrot -d0 --focused "$dest"
		;;
	selection)
		/usr/bin/scrot -d0 --select "$dest"
		;;
esac

dunstify -i $(get_last) "scrot" "Screenshot taken"

