#!/bin/bash

DIR=$(dirname $0)
source $DIR/utils.sh

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
	echo "Installing Python environment manager"

	# install Python version manager as a regular user
	#curl -L https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
	git clone git://github.com/pyenv/pyenv.git ~/.pyenv
	git clone git://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update
	#git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
	git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

	# use \EOF to avoid evaluating variables
	cat <<- \EOF >> ~/.init.sh

	########################## pyenv configuration #########################
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	if command -v pyenv 1>/dev/null 2>&1 
	then
		eval "$(pyenv init -)"
		eval "$(pyenv init --path)"
		eval "$(pyenv virtualenv-init -)"
	fi

	#export PATH="$HOME/.pyenv/bin:$PATH"
	#eval "$(pyenv init -)"
	#eval "$(pyenv virtualenv-init -)"
	EOF
	
	echo "sourcing $HOME/.init.sh"
	. "$HOME/.init.sh"

	echo installing actual Python version
	PYTHON_VERSION=$(pyenv install -l|sort |egrep '^\s+[0-9]+[^a-z]+[0-9]+$'|tail -n 1)
	# build CPython with shared library
	env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $PYTHON_VERSION
	pyenv global $PYTHON_VERSION
	#env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 2.7.10
	#pyenv virtualenv $PYTHON_VERSION alg
	#pyenv activate alg

	#brew uninstall --ignore-dependencies python2

	pip install ipython \
		jupyter \
		pep8 \
		flake8 \
		bash_kernel
	python -m bash_kernel.install
}

if [ $(uname -s) == "Linux" ]
then
	sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
		libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
		xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
fi

#setup_python_mirror
setup_python
