#!/bin/sh

rsync -av /etc/hosts data/etc/
rsync -av --files-from=../conf/home-files.conf ../data/home
