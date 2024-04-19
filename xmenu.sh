#!/usr/bin/bash
base="/usr/share/icons/Papirus-Dark"
xmenu << EOF | sh &
General
	IMG:$base/128x128/apps/firefox.svg	Firefox	firefox
	IMG:$base/128x128/apps/kitty.svg	kitty	kitty
	IMG:$base/128x128/apps/nautilus.svg	Files	nautilus
	IMG:$base/128x128/apps/telegram.svg	Telegram	telegram-desktop
	IMG:$base/128x128/apps/discord.svg	Discord		discord
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
	IMG:$base/symbolic/apps/gnome-control-center-symbolic.svg	Control panel	gnome-control-center
	IMG:$base/symbolic/apps/gnome-control-center-symbolic.svg	KDE settings	systemsettings

run...			dmenu
lock				i3lock-fancy
IMG:$base/symbolic/actions/system-reboot-symbolic.svg	reboot			reboot
IMG:$base/symbolic/actions/system-shutdown-symbolic.svg	shutdown		poweroff
EOF
