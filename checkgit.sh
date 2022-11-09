#!/bin/bash

listgit=("dwm" "st" "slstatus" "dmenu")

for ix in ${listgit[*]}
do
	nx=0
	while [[ $nx -lt $COLUMNS ]]
	do
		echo -n "=" 
		let nx=$nx+1
	done
	echo "Repo: $ix"
	cd "$HOME/git/$ix"
	git status
	printf "\n"
done
