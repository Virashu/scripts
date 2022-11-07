#!/bin/bash

echo "Starting initialization"

if ! command -v git &> /dev/null
then
	echo "git is not installed"
	exit
fi

git init --bare $HOME/.cfg
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

config remote add origin git@github.com:virashu/dotfiles.git

echo "Initialized successfully!"
