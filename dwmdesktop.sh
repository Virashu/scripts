#!/bin/bash

read -p "Full launch script path(incl. name): " dwmpath

#nvim /usr/local/share/xsessions/dwm.desktop 


sudo touch /usr/share/xsessions/dwm.desktop
sudo touch /usr/local/share/xsessions/dwm.desktop
sudo touch /usr/local/share/xsession/dwm.desktop

echo "[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic Window Manager
Exec=bash $dwmpath
Icon=dwm
Type=XSession" | sudo tee --append /usr/share/xsessions/dwm.desktop /usr/local/share/xsession/dwm.desktop /usr/local/share/xsessions/dwm.desktop > /dev/null
