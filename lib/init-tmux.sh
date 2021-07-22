#!/bin/bash

setup_tmux() {
	#brew install tmux

	cat <<- \EOF >> ~/.init.sh


	################################### Tmux ############################################
	export tmux_conf_new_window_retain_current_path=true
	export tmux_conf_theme_highlight_focused_pane=true
	#alias tclear="clear && tmux clear" # use Ctrl+L to clear
	EOF

}

if [ "$(uname -s)" == "Linux" ]
then
	sudo apt install -y tmux
fi

setup_tmux
