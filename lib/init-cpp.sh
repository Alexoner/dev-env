#!/bin/bash

DIR=$(dirname $0)
source $DIR/utils.sh

if [ $(uname -s) == "Linux" ]
then
	sudo apt install -y build-essential tar curl zip unzip \
		libssl-dev zlib1g-dev libbz2-dev \
		libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
		xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
fi



PKG_DIR=$HOME/lib/vcpkg

mkdir -p $PKG_DIR || true
git clone https://github.com/microsoft/vcpkg $PKG_DIR

pushd $PKG_DIR
./bootstrap-vcpkg.sh

cat <<\EOF >> ~/.init.sh 
# https://github.com/Microsoft/vcpkg/
export PKG_DIR=$HOME/lib/vcpkg
export PATH="$PATH":$PKG_DIR

EOF
