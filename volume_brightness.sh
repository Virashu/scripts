#!/bin/bash


bar_color="#fabd2f"
hi_bar_color="#fb4934"
volume_step=5
brightness_step=5
max_volume=125


function get_volume {
  pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

function get_mute {
  pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

function get_brightness {
  xbacklight -get
}

function get_volume_icon {
  bash ~/Documents/volume.sh
}

function get_brightness_icon {
  brightness_icon="󰃞"
}

function show_volume_notif {
  volume=$(get_volume)
  icon=$(get_volume_icon)
  if [ "$volume" -gt 100 ]; then
    dunstify -i volume -t 1000 -r 2593 -u normal "$icon $volume%" -h int:value:$volume -h string:hlcolor:$hi_bar_color
  else
    dunstify -i volume -t 1000 -r 2593 -u normal "$icon $volume%" -h int:value:$volume -h string:hlcolor:$bar_color
  fi
}

function show_brightness_notif {
  brightness=$(get_brightness)
  get_brightness_icon
  dunstify -i brightness -t 1000 -r 2593 -u normal "$brightness_icon $brightness%" -h int:value:$brightness -h string:hlcolor:$bar_color
}

function show_battery_notif {
	charge=$(cat /sys/class/power_supply/BAT1/capacity)
	charge_icon=$(bash /home/virashu/Documents/battery.sh)
	dunstify -i charge_icon -t 1000 -r 2593 -u normal "$charge_icon $charge%" -h int:value:$charge -h string:hlcolor:$bar_color
}

function show_time_notif {
	dunstify -t 2500 -r 2593 -u normal "$(date)"
}

case $1 in
  volume_up)
    pactl set-sink-mute @DEFAULT_SINK@ 0
    volume=$(get_volume)
    if [ $(( "$volume" + "$volume_step" )) -gt $max_volume ]; then
      pactl set-sink-volume @DEFAULT_SINK@ $max_volume%
    else
      pactl set-sink-volume @DEFAULT_SINK@ +$volume_step%
    fi
    show_volume_notif
    ;;
  volume_down)
    pactl set-sink-volume @DEFAULT_SINK@ -$volume_step%
    show_volume_notif
    ;;
  volume_mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    show_volume_notif
    ;;
  brightness_up)
    xbacklight -inc $brightness_step -time 0
    show_brightness_notif
    ;;
  brightness_down)
    xbacklight -dec $brightness_step -time 0
    show_brightness_notif
    ;;
	notify_volume)
		show_volume_notif
		;;
	notify_brightness)
		show_brightness_notif
		;;
	notify_battery)
		show_battery_notif
		;;
	notify_time)
		show_time_notif
		;;
esac
