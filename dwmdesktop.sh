#!/bin/bash

read -p "Full launch script path(incl. name): " dwmpath

touch /usr/share/xsessions/dwm.desktop
echo "[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic Window Manager
Exec=bash $dwmpath
Icon=dwm
Type=XSession" >> /usr/share/xsessions/dwm.desktop
