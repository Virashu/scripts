#!/bin/bash

W=1280
H=720

P="eDP"
O="DisplayPort-0"

PW=`xrandr --current | egrep '\*' | awk '{print $1;}' | cut -d x -f 1 | head -n 1`

gtf $W $H 120 | sed '3q;d' | sed 's/Modeline//g' | xargs xrandr --newmode
gtf $W $H 120 | sed '3q;d' | sed 's/Modeline//g' | awk '{print $1;}' | sed 's/^.\(.*\).$/\1/' | xargs xrandr --addmode $O
gtf $W $H 120 | sed '3q;d' | sed 's/Modeline//g' | awk '{print $1;}' | sed 's/^.\(.*\).$/\1/' |xargs xrandr --output $O --right-of $P --mode
sleep 1

echo "Starting VNC server"
x11vnc -display :0 -clip ${W}x${H}+${PW}+0 -repeat -forever -nonap -multiptr -noxfixes

xrandr --output ${O} --off

