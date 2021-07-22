#!/usr/bin/env bash


# install essential tools for debugging, system management
if [ "$(uname -s)" == "Linux" ]
then
	sudo apt install -y strace net-tools gdb nginx iftop iotop \
		parallel \
		linux-tools-common linux-tools-generic linux-tools-`uname -r`
fi
