#!/bin/sh

setup_brew() {

	# TODO: install linuxbrew or homebrew according to operating system(mac or linux)
	echo "=========================== installing linuxbrew ==================="
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

	cat <<-\EOF >> $HOME/.init.sh
	##################### linux brew ############################
	export PATH="/home/hdu/.linuxbrew/bin:$PATH"
	export MANPATH="/home/hdu/.linuxbrew/share/man:$MANPATH"
	export INFOPATH="/home/hdu/.linuxbrew/share/info:$INFOPATH"
	EOF

	. ~/.init.sh
}

setup_brew
