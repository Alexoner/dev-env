#!/bin/sh


setup_vim () {
	#source ~/.python3/bin/activate
	pip install neovim
	echo "=====================installing spf13=====================$(whoami)"
	curl https://raw.githubusercontent.com/Alexoner/spf13-vim/3.0/bootstrap.sh -L |sh -s
	#exit
	cat <<- \EOF >> ~/.init.sh


	################################### vim ###################################################
	export EDITOR=nvim
	alias vi="vim"
	alias vim="nvim"
	alias vimdiff="nvim -d"
	EOF
}

setup_vim
