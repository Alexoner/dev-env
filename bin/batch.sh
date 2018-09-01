#!/bin/sh

# batch processing usages
# notation
# {}: placeholder
# \; escape ';' to indicate command end

## find
find . -type f -exec echo 'processing {}' \;

## xargs
find . -type f| xargs -I {} echo 'processing {}'

## parallel

## cmd |while read f

find . -type f| while read f
do
	echo processing $f
done
