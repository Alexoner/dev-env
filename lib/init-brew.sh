#!/bin/sh

install_packages() {
  brew install gh
  brew install pyenv
  brew install ripgrep
  # gh auth login
}

setup_brew() {

	# TODO: install linuxbrew or homebrew according to operating system(mac or linux)
	echo "=========================== installing linuxbrew ==================="
 	echo "Visit https://brew.sh/ for more details"

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	cat <<-\EOF >> $HOME/.init.sh
	##################### linux brew ############################
	export PATH=$PATH:"/home/linuxbrew/.linuxbrew/bin/"  # new brew path
	# export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
	# export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
	EOF

	. ~/.init.sh
}

setup_brew

install_packages || echo "install brew packges failed"
