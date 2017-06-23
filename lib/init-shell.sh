#!/bin/sh

#
setup_shell () {
	echo "=====================setting up zsh=====================$(whoami)"
	# install oh-my-zsh
	export ZSH=""
	cd "$HOME"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# configure general init script
	echo 'PROMPT="%{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"' >> ~/.zshrc

	# source a separate init script
	touch $HOME/.init.sh
	cat <<-EOF >> ~/.zshrc

	############################# custom initialization script #########################
	if [ -f \$HOME/.init.sh ]
	then
		. \$HOME/.init.sh
	fi
	EOF

	cat <<-EOF >> ~/.bashrc

	############################# custom initialization script #########################
	if [ -f \$HOME/.init.sh ]
	then
		. \$HOME/.init.sh
	fi
	EOF

	#exit
}

setup_shell
