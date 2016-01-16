#!/bin/sh

BASEDIR=$(dirname "$0")
rsync -av /etc/hosts "$BASEDIR/../data/etc/"
rsync -av --files-from="$BASEDIR/../conf/home-files.conf" "$HOME" "$BASEDIR/../data/home"
rsync -av "$HOME/Library/Fonts" "$BASEDIR/../data/home/.fonts"
