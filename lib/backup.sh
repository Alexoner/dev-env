#!/bin/sh

BASEDIR=$(dirname "$0")
sh "$BASEDIR/backup-file.sh"
sh "$BASEDIR/backup-python-list.sh"
sh "$BASEDIR/backup-homebrew-list.sh" > "$BASEDIR/../data/homebrew/restore-homebrew.sh"
