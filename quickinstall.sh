#!/bin/bash

echo "Starting initialization"

if ! command -v git &> /dev/null
then
	echo "git is not installed"
	exit
fi

read -c "github username: " username
read -c "github email: " email
git config --global user.email "$email"
git config --global user.name "$username"

git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
git --git-dir=$HOME/.cfg --work-tree=$HOME config --local status.showUntrackedFiles no

if [[ "$SHELL" == "/bin/bash" ]]; then
	echo "You are using bash"
	echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'" >> $HOME/.bashrc
elif [[ "$SHELL" == "/usr/bin/zsh" ]] || [[ "$SHELL" == "/bin/zsh" ]]; then
	echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'" >> $HOME/.zshrc
else
	echo "ERROR"
	exit
fi

git --git-dir=$HOME/.cfg --work-tree=$HOME remote add origin git@github.com:virashu/dotfiles.git

echo "Initialized successfully!"
