#!/bin/sh

echo 'Restoring npm packages'
BASEDIR=$(dirname "$0")
NPM_DIR=$BASEDIR/../data/npm
FILE="$NPM_DIR/package.list"

xargs npm install -g < "$FILE"
