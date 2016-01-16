#!/bin/sh

BASEDIR=$(dirname "$0")
rsync -av /etc/hosts "$BASEDIR/../data/etc/"
rsync -avz --include-from "$BASEDIR/../conf/home-files.lst" --exclude='*' "$HOME/" "$BASEDIR/../data/home"
# rsync -av "$HOME/Library/Fonts" "$BASEDIR/../data/home/.fonts"
