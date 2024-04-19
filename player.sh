#!/bin/env bash


fallback_image="/usr/share/icons/Papirus-Dark/16x16/apps/audio-player.svg"
delay=0.5

function get_status {
	echo $(playerctl status)
}

function get_icon {
	local status=$(get_status)

	if [ "$status" = "Playing" ]; then
		echo ""
	elif [ "$status" = "Paused" ]; then
		echo ""
	fi
}

function get_title {
	echo $(playerctl metadata title)
}

function get_image {
	#f=$(playerctl metadata mpris:artUrl) && file=${f#"file://"} && [ ${#file} -lt 200 ] && round $file || \
	local _file=$(playerctl metadata mpris:artUrl)

	if [[ $? ]]; then
		echo ${_file#"file://"}
	else
		echo $fallback_image
	fi
}

function round() {
	echo $(bash /home/virashu/scripts/round.sh "$1")
}

title=$(get_title)
prev_title=$title

status=$(get_status)
prev_status=$status
# Paused Playing Stopped

while true; do
	status=$(get_status)
	title=$(get_title)
	if [ "$status" != "$prev_status" ] || [ "$title" != "$prev_title" ]; then
		prev_status=$status
		prev_title=$title
		if [ "$title" != "" ]; then
			icon=$(get_icon)
			image=$(get_image)

			echo "Image: ${image}"
			dunstify -i "${image}" -r 813 -u normal -t 5000 "${status}:" "${title}"
		fi
	fi
	sleep $delay
done

