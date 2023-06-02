#!/bin/sh

# image="$HOME/.local/share/icons/Papirus-Dark/16x16/apps/audio-player.svg"
# dunstify -i $image -r 2593 -u normal "Now Playing:" "$(mpc current)"

music_library="$HOME/music"
fallback_image="/usr/share/icons/Papirus-Dark/16x16/apps/audio-player.svg"

#f=$(playerctl metadata mpris:artUrl)
#file=${f=$(playerctl metadata mpris:artUrl)#"file://"}
#ffmpeg -y -i "$(playerctl metadata)" /tmp/mpd_cover.jpg > /dev/null 2>&1 && \
#dunstify -i /tmp/mpd_cover.jpg -r 2593 -u normal "Now Playing:" "$(playerctl metadata title)" || \
f=$(playerctl metadata mpris:artUrl) && \
file=${f#"file://"} && \
dunstify -i $file -r 2593 -u normal "[1] Now Playing:" "$(playerctl metadata title)" || \
dunstify -i $fallback_image -r 2593 -u normal "[2] Now Playing:" "$(playerctl metadata title)"
