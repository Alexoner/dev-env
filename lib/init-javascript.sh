#!/bin/sh

setup_javascript() {
	echo "===================== setting up nodejs =====================$USER"
	echo "Installing node environment manager NVM"
	# install Python version manager as a regular user
	brew install nvm
	mkdir ~/.nvm

	# use \EOF to avoid evaluating variables
	cat <<- \EOF >> ~/.init.sh

	######################### nvm configuration #########################
	export NVM_DIR="$HOME/.nvm"
	. "/home/hdu/.linuxbrew/opt/nvm/nvm.sh"


	EOF
	
	echo "sourcing $HOME/.init.sh"
	. "$HOME/.init.sh"

	echo "installing actual nodejs"
	NODE_VERSION="v8.11.3"
	nvm install $NODE_VERSION
	nvm use $NODE_VERSION

	brew uninstall --ignore-dependencies python2
}

setup_javascript
