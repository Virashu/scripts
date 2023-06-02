#!/bin/bash

dir="/home/virashu/Pictures/screenshots"
dest="$dir/%Y-%m-%d-%s_\$wx\$h.jpg"


function get_last {
	find /home/virashu/Pictures/screenshots -maxdepth 1 -type f -printf '%T@ %p\n' | sort -k1,1nr | head -1 | awk '{print $2}'
}

case $1 in
	normal)
		/usr/bin/scrot -d0 "$dir/$dest"
		;;
	focused)
		/usr/bin/scrot -d0 --focused "$dir/$dest"
		;;
	selection)
		/usr/bin/scrot -d0 --select "$dir/$dest"
		;;
esac

dunstify -i $(get_last) "scrot" "Screenshot taken"

