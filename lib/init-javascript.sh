#!/bin/bash

DIR=$(dirname $0)
source $DIR/utils.sh

setup_javascript() {
	echo "===================== setting up nodejs =====================$USER"
	echo "Installing node environment manager NVM"
	# install Python version manager as a regular user
	#brew install nvm
	if [ "$(uname -s)" == "Linux" ]
	then
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
		mkdir ~/.nvm

		# use \EOF to avoid evaluating variables
		cat <<- \EOF >> ~/.init.sh

		######################### nvm configuration #########################
		export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


		EOF
	elif [ "$(get-os)" == "Darwin" ]
	then
		brew install nvm
	fi

	echo "sourcing $HOME/.init.sh"
	. "$HOME/.init.sh"

	echo "installing actual nodejs"
	# NODE_VERSION="v10.14.1"
	NODE_VERSION="stable"
	nvm install $NODE_VERSION
	nvm use $NODE_VERSION

	#brew uninstall --ignore-dependencies python2
}

setup_javascript
