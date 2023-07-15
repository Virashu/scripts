#!/bin/env bash


#size="500x500"
size=$(identify -format "%wx%h" "$1")>/dev/null

width=$(echo $size | tr 'x' '\n' | head -1)
height=$(echo $size | tr 'x' '\n' | tail -1)
file="$1"
temp="/home/virashu/scripts/temp"
radius=64


#convert -size "$size" xc:#00000000 -fill white -draw "roundRectangle 0,0,$width,$height 32,32" gencardmask.png
convert -size "$size" xc:black -fill white -draw "roundRectangle 0,0,$width,$height $radius,$radius" $temp/gencardmask.png
convert $1 $temp/gencardmask.png -alpha Off -compose CopyOpacity -composite -colorspace RGB $temp/res.png

echo $temp/res.png

