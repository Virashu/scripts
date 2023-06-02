#!/bin/bash

dir="/home/virashu/Pictures/screenshots"
dest="$dir/%Y-%m-%d-%s_\$wx\$h.jpg"


function get_last {
	find $dir -maxdepth 1 -type f | sort -k1,1nr | head -1
	#stat -c '%Y %n' $dir/* | sort -k1,1nr | head -1
}

case $1 in
	normal)
		#/usr/bin/scrot -d0 "$dest"
		echo $(get_last)
		dunstify "scrot" "Screenshot taken" -i "$dir/$(get_last)"
		;;
	focused)
		/usr/bin/scrot -d0 --focused "$dest"
		dunstify "scrot" "Screenshot taken" -i "$dir/$get_last"
		;;
	selection)
		/usr/bin/scrot -d0 --select "$dest"
		dunstify "scrot" "Screenshot taken" -i "$dir/$get_last"
		;;
esac

