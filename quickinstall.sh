#!/bin/bash

echo "Starting initialization"

if ! command -v git &> /dev/null
then
	echo "git is not installed"
	exit
fi

git init --bare $HOME/.config
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
config config --local status.showUntrackedFiles no

if [[ "$SHELL" == "/bin/bash" ]]; then
	echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'" >> .bashrc
elif [[ "$SHELL" == "/usr/bin/zsh" ]]; then
	echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'" >> .zshrc
else
	echo "ERROR"
	exit
fi

echo "Initialized successfully!"

read -p "Wish to move dotfiles? [Y/n]" ans
if [[ $ans == 'n' ]] || [[ $ans == 'N' ]]; then
	echo "Quitting..."
	exit
fi
if [[ $ans == 'y' ]] || [[ $ans == 'Y' ]] || [[ $ans == '' ]]; then
	rsync -av --progress ./ $HOME/ --exclude quickinstall.sh
fi
