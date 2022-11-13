
read -p "Using NeoVim? (y/n) " ans
if [[ $ans == 'y' ]] || [[ $ans == 'Y' ]]; then
	if [[ ! -f $HOME/.config/nvim/init.vim ]]; then
		echo "init.vim not found, creating... "
		mkdir $HOME/.config/nvim
		touch $HOME/.config/nvim/init.vim
	fi
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	echo "Adding source to init.vim... "
	echo "source $HOME/.vimrc" >> $HOME/.config/nvim/init.vim
	echo "Installing vim-plug..."

else
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fi
 
