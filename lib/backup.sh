#!/bin/sh

sh lib/back-file.sh
sh lib/backup-python-list.sh
sh lib/backup-homebrew-list.sh > ../data/homebrew/restore-homebrew.sh
