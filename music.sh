#!/bin/bash


function get_title {
  title=$(playerctl metadata title 2>/dev/null)
}

function get_status {
  status=$(playerctl status 2>/dev/null)
}

get_title
get_status
bg=$(xrdb -query | grep -Po '(?<=\*.bg1:\t)(#[0-9abcdef]{6})')

#npi=$(echo "$title" | grep "No pla")

sp=' '
if [ ${#title} -gt 20 ]; then
  title="$(echo $title | head -c 20)..."
fi

if grep -q 'No pla' <<< "$title" || ! playerctl status 2>/dev/null >/dev/null; then
  msg=""
elif [ "$status" == "Stopped" ]; then
  msg=""
elif [ "$status" == "Paused" ]; then
  msg="^c$bg^^d^^b$bg^  $title ^d^^c$bg^^d^ "
else
  msg="^c$bg^^d^^b$bg^  $title ^d^^c$bg^^d^ "
fi

#msg=$(echo "$msg" | head -c 80)

echo "$msg"

