#!/bin/bash

has_gpu () {
	nGPU=`lspci | grep -i 'NVIDIA' | cut -d" " -f 1 | wc -l`
	echo $nGPU
	return $nGPU
}

install_ml () {
	SCRIPT_DIR=`dirname $0`
	echo "script directory is $SCRIPT_DIR"

	echo "===================== configuring ml =====================$(whoami)"
	. "$HOME/.init.sh"

	if [ `has_gpu` -gt 0 ]
	then
		echo "has nvidia gpu, installing tensorflow-gpu"
		tensorflow="tensorflow-gpu"
	else
		echo "no nvidia gpu found, installing tensorflow"
		tensorflow="tensorflow"
	fi
	pip install \
		sklearn \
		pandas \
		matplotlib \
		tensorflow \
		keras
	
	# TODO: setup matplotlib Chinese font
	cp -v $SCRIPT_DIR/../share/fonts/文泉驿等宽正黑.ttf ~/.local/share/fonts/
	#sed -i 's///g' 

}

install_ml
#has_gpu
