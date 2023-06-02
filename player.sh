#!/bin/bash2


music_library="$HOME/music"
fallback_image="/usr/share/icons/Papirus-Dark/16x16/apps/audio-player.svg"


function get_status {
	status=$(playerctl status)
}

function get_icon {
	$(get_status)

	if [ "$status" = "Playing" ]; then
		icon=""
	elif [ "$status" = "Paused" ]; then
		icon=""
	fi
}

function get_title {
	title=$(playerctl metadata title)
	#title=
}

function get_pos {
	lengthh=$(playerctl metadata mpris:length)
	length=$(( "$lengthh" / 1000000 ))
	now=$(playerctl position)
	awk "BEGIN {print $now / $length * 100}" 
}

function notify2 {
	f=$(playerctl metadata mpris:artUrl) && \
	file=${f#"file://"} && \
	dunstify -i $file -r 2593 -u normal "[1] Now Playing:" "$(playerctl metadata title)" || \
	dunstify -i $fallback_image -r 2593 -u normal "[2] Now Playing:" "$(playerctl metadata title)"
}

function get_image {
	f=$(playerctl metadata mpris:artUrl) && \
	file=${f#"file://"} || \
	file=$fallback_image
}

get_title
prev_title=$title

get_status
prev_status=$(status)
# Paused Playing Stopped

while true; do
	get_status
	get_title
	#	echo "$status"
	if [ "$status" != "$prev_status" ] || [ "$title" != "$prev_title" ]; then
		prev_status=$status
		prev_title=$title
		pos=$(get_pos)
		get_icon
		get_image
		#notify-send -t 1000 "$icon $title"
		#dunstify -i $file -u normal -t 1000 "$icon $title" -h int:value:$pos
		dunstify -i $file -u normal -t 5000 "$status:" "$title"
	fi
done

