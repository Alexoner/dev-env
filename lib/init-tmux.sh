#!/bin/sh

setup_tmux() {
	brew install tmux

	cat <<- \EOF >> ~/.init.sh


	################################### Tmux ############################################
	export tmux_conf_new_window_retain_current_path=true
	alias tclear="clear && tmux clear"
	EOF

}

setup_tmux
