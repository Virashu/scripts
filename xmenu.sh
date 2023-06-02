#!/bin/sh
base="/usr/share/icons/Papirus-Dark"
xmenu <<EOF | sh &
General
	kitty	kitty
	Files	nautilus
Coding
	IMG:$base/128x128/apps/code.svg	vscode	code
	IMG:$base/128x128/apps/io.neovim.nvim.svg	kitty nvim
Graphics
	IMG:$base/128x128/apps/krita.svg	Krita		krita
Audio
	IMG:$base/128x128/apps/lollypop.svg		Lollypop	lollypop
	IMG:$base/128x128/apps/musikcube.svg	Musikcube	musikcube
	IMG:$base/128x128/apps/app.svg				CMus			cmus
	Piano		drumstick-vpiano
Games
	Techmino	techmino_development
	MultiMC		multimc
System
	OpenTabletDriver	otd-gui
	Control panel			gnome-control-center
	KDE settings			systemsettings

run...			dmenu
lock				slock
IMG:$base/symbolic/actions/system-reboot-symbolic.svg	reboot			reboot
IMG:$base/symbolic/actions/system-shutdown-symbolic.svg	shutdown		poweroff
EOF
