#!/bin/sh

setup_python_mirror () {
	echo "=====================setting up python mirror=====================$(whoami)"
	mkdir ~/.pip
	# change pip' mirror url
	cat <<- EOF  > ~/.pip/pip.conf
	[global]
	#index-urls:  https://pypi.douban.com, https://mirrors.aliyun.com/pypi,
	#checkout https://www.pypi-mirrors.org/ for more available mirror servers
	index-url = https://pypi.douban.com/simple
	trusted-host = pypi.douban.com
	EOF
}

setup_python() {
	echo "=====================setting up python=====================$USER"

	# install Python version manager as a regular user
	curl -L https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
	# use \EOF to avoid evaluating variables
	cat <<- \EOF >> ~/.init.sh

	########################## pyenv configuration #########################
	export PATH="$HOME/.pyenv/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
	EOF
	
	echo "sourcing $HOME/.init.sh"
	. ~/.init.sh

	PYTHON_VERSION=3.6.0
	pyenv install $PYTHON_VERSION
	pyenv global $PYTHON_VERSION
	pyenv virtualenv $PYTHON_VERSION alg
	pyenv activate alg

	#pyenv install 2.7.10
}

setup_python_mirror
setup_python
