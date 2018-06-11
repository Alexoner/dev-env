#!/bin/sh


install_ml () {
	echo "===================== configuring ml =====================$(whoami)"
	. "$HOME/.init.sh"
	pip install \
		sklearn \
		pandas \
		matplotlib \
		tensorflow \
		keras
}

install_ml
