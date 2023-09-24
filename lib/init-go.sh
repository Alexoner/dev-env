#!/bin/bash

# follow https://github.com/golang/go/wiki/Ubuntu

setup_go() {
	echo "=====================setting up go=====================$USER"
	echo "Installing go environment manager"

  sudo apt-get install -y bison
  bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

	cat << \EOF >> $HOME/.init.sh
[[ -s "$HOME/.gvm/scripts/gvm"  ]] && source "$HOME/.gvm/scripts/gvm"
EOF

	source $HOME/.gvm/scripts/gvm
	# Go 1.5+ removed the C compilers from the toolchain.
	# To install go 1.5+, you must have go installed, or install from binary with -B
	gvm install go1.4 -B
  gvm use go1.4
  export GOROOT_BOOTSTRAP=$GOROOT
  gvm install go1.17.13
  gvm use go1.17.13
  export GOROOT_BOOTSTRAP=$GOROOT
  gvm install go1.20
  gvm use go1.20
}

if [ $(uname -s) == "Linux" ]
then
	sudo apt-get install -y bison
fi

setup_go
