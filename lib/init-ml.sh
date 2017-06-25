#!/bin/sh


install_ml () {
	echo "===================== configuring ml =====================$(whoami)"
	. "$HOME/.init.sh"
	pip install \
		sklearn \
		padas \
		matplotlib \
		tensorflow \
		keras
}

install_ml
