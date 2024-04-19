#!/bin/bash


title=$(playerctl metadata title 2>/dev/null)
status=$(playerctl status 2>/dev/null)
bg=$(xrdb -query | grep -Po '(?<=\*.bg1:\t)(#[0-9abcdef]{6})')

if [ ${#title} -gt 20 ]; then
  title=$(printf %s "${title:0:17}...")
fi

if grep -q "No pla" <<< "$title" || ! playerctl status &>/dev/null || [ "$status" == "Stopped" ]; then
  echo ""
  exit
fi

#icon_active=""
#icon_paused=""

icon_paused=""
icon_active=""
#icon_active="󰏤"

if [ "$status" == "Paused" ]; then
  icon="${icon_paused}"
else
  icon="${icon_active}"
fi

# Minimal
#msg="^c${bg}^^d^^b${bg}^ ${icon} ${title} ^d^^c${bg}^^d^ "

esc_prev="\x0b"
esc_pause="\x0c"
esc_next="\x0a"
esc_clear="\x01"

# With controls
msg="^c${bg}^^d^^b${bg}^${esc_prev}   ${esc_pause}${icon} ${esc_next}  ${esc_clear}${title} ^d^^c${bg}^^d^ \n"

echo -e "${msg}"

