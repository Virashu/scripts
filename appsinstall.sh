#!/bin/bash

sudo pacman -S picom alacritty neovim krita firefox -y

git clone https://aur.archlinux.org/yay.git

cd yay
makepkg -si

yay -S musikcube cava
