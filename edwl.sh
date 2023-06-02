#!/bin/bash

setxkbmap -option
setxkbmap -layout us,ru,jp
dunst -config ~/.config/dunst/gruvbox.conf &
bash ~/scripts/battery_alert.sh &
bash ~/scripts/player.sh &
picom &
xrdb -merge .Xresources &
slstatus &
sh ~/.fehbg &
exec dwl >> ~/.logs/dwl.log
