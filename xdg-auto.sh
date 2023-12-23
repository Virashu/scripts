#!/bin/sh
base="/usr/share/icons/Papirus-Dark"
xmenu <<EOF | sh &
$(xdg-xmenu)
EOF
