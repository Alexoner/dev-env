#!/bin/sh

echo 'Backing up npm packages'
BASEDIR=$(dirname "$0")
NPM_DIR=$BASEDIR/../data/npm
FILE="$NPM_DIR/package.list"
mkdir -p "$NPM_DIR"
# dump installed packages in JSON format
# npm -g ls | grep -E "^(├|└)─" | cut -d" " -f2 | awk -v quote='"' 'BEGIN { FS = "@" } ; { print quote $1 quote,":",quote $2 quote"," }' | sed -e 's/ :/:/g' > "$FILE"

# dump installed packages in pacakge@version list format
npm -g ls | grep -E "^(├|└)─" | cut -d" " -f2 | sed -e 's/ :/:/g' > "$FILE"
