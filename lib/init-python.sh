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
	cat <<- EOF >> ~/.init.sh

	########################## pyenv configuration #########################
	export 'PATH="$HOME/.pyenv/bin:$PATH"'
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
	EOF

	PYTHON_VERSION=3.6.0
	pyenv install $PYTHON_VERSION
	pyenv global $PYTHON_VERSION
	pyenv virtualenv $PYTHON_VERSION alg
	pyenv activate alg

	pyenv install 2.7.10

	#source ~/.zshrc

	#su - $WORK_USER -c "virtualenv $HOME/.python3 -p python3.6"
	#VENV_DIR=$HOME/.python3
	#python3.6 -m venv $VENV_DIR
	#echo 'source $VENV_DIR/bin/activate' >> ~/.zshrc
	#source $VENV_DIR/bin/activate
	#pip install setuptools
	#pip install virtualenv #virtualenvwrapper
	# TODO: install from requirements.txt
	#deactivate
}

setup_python_mirror
setup_python
