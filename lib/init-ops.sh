#!/usr/bin/env bash


# install essential tools for debugging, system management
if [ "$(uname -s)" == "Linux" ]
then
	sudo apt install -y clangd clang gdb \
		linux-tools-common strace \
		silversearcher-ag jq \
		net-tools traceroute \
		iftop iotop \
		parallel \
		linux-tools-common linux-tools-generic linux-tools-`uname -r` \
		nginx
fi
