#!/bin/bash

# follow https://github.com/golang/go/wiki/Ubuntu

setup_go() {
	echo "=====================setting up go=====================$USER"
	echo "Installing go environment manager"

	sudo add-apt-repository ppa:longsleep/golang-backports
	sudo apt update
	sudo apt install golang-go # latest
}

setup_go
