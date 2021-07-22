#!/bin/bash

# follow https://github.com/golang/go/wiki/Ubuntu

setup_go() {
	echo "=====================setting up go=====================$USER"
	echo "Installing go environment manager"

	bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

	cat << \EOF >> $HOME/.init.sh
[[ -s "/home/haodu/.gvm/scripts/gvm"  ]] && source "/home/haodu/.gvm/scripts/gvm"
EOF

	source /home/haodu/.gvm/scripts/gvm
	# Go 1.5+ removed the C compilers from the toolchain. 
	# To install go 1.5+, you must have go installed, or install from binary with -B
	gvm install go1.4 -B
	gvm use go1.4
	# gvm install go1.14
	#sudo add-apt-repository ppa:longsleep/golang-backports
	#sudo apt update
	#sudo apt install golang-go # latest
}

if [ $(uname -s) == "Linux" ]
then
	sudo apt-get install -y bison
fi

setup_go
