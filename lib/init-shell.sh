#!/bin/bash

DIR=$(dirname $0)
source $DIR/utils.sh

setup_shell () {
	echo "=====================setting up zsh=====================$(whoami)"
	echo "REMEMBER: EXIT ZSH AFTER INSTALLING oh-my-zsh to proceed..."
	# install oh-my-zsh
	export ZSH=""
	cd "$HOME"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# configure general init script
	echo 'PROMPT="[\$(date +%H:%M:%S)] %{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"' >> ~/.zshrc

	# source a separate init script
	touch $HOME/.init.sh
	# heredoc << EOF. <<- for tab indentation, EOF is the delimiter, \EOF stops environment variable being evaluated.
	cat <<-\EOF >> $HOME/.init.sh
	# source customized initailization script
	if [ -f $HOME/.init.local.sh ]
	then
		. $HOME/.init.local.sh
	fi

	# locale
	export LANG=en_US.UTF-8

	export PATH=$PATH:$HOME/bin

	################################# SHELL configuration ###############################
	if [ $SHELL = "/bin/zsh" ]
	then
		################################# SHELL prompt configuration ####################
		if [[ $PROMPT =~ '^.+date.+$' ]] # regular expression comparison
		then
			#echo "prompt is already set"
			:
		else
			export PROMPT="[\$(date +%H:%M:%S)] %{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"
		fi
		################################# SHELL HISTORY configuration ###################
		setopt HIST_IGNORE_ALL_DUPS # `man zshoptions`. If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event). But this only works with `history` command, not the safed history file.
		setopt HIST_IGNORE_DUPS     # If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event).
		setopt HIST_IGNORE_SPACE    # man zshoptions
		setopt HIST_FIND_NO_DUPS    # when searching for history entries, do not display duplicates.

	fi


	################################### Tmux ############################################
	export tmux_conf_new_window_retain_current_path=true

	################################### bindkey ############################################
	bindkey "^P" up-line-or-search # equivalent to Up
	bindkey "^N" down-line-or-search # equivalent to Down

	################################### alias ############################################
	alias sl=ls

EOF

	cat <<-\EOF >> ~/.zshrc

	############################# custom initialization script #########################
	if [ -f $HOME/.init.sh ]
	then
		. $HOME/.init.sh
	fi
EOF

	cat <<-\EOF >> ~/.bashrc

	############################# custom initialization script #########################
	if [ -f $HOME/.init.sh ]
	then
		. $HOME/.init.sh
	fi
EOF

	. ~/.init.sh
}

if [ "$(uname -s)" == "Linux" ]
then
    sudo apt install -y zsh tmux
	uname -a |grep 'microsoft' # check whether the linux is WSL(windows subsystem for Linux)
	if [ $? = 0 ]
	then
		echo "Running in WSL"
		cat <<- \EOF >> ~/.init.sh
		LoadVS () {
			# load visual studio environment variables
			export PATH=$(find "/mnt/c/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/" -iname 'MSBuild.exe'|while read f; do echo $(dirname $f); done |head -n 2|sort |head -n 1):$PATH
			export PATH=$(find "/mnt/c/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/" -iname 'vstest.console.exe'|while read f; do echo $(dirname $f); done |head -n 2|sort |head -n 1):$PATH
		}

		export DISPLAY=:0  # OAuth2 lib can open windows browser
		EOF
	fi
fi

setup_shell
