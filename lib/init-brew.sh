#!/bin/sh

setup_brew() {

	# TODO: install linuxbrew or homebrew according to operating system(mac or linux)
	echo "=========================== installing linuxbrew ==================="
 	echo "Visit https://brew.sh/ for more details"
  
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	cat <<-\EOF >> $HOME/.init.sh
	##################### linux brew ############################
	export PATH="/home/linuxbrew/.linuxbrew/bin/"  # new brew path
	# export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
	# export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
	EOF

	. ~/.init.sh
}

setup_brew
