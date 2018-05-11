#!/bin/sh

# shell script example to iterate entries in file or directory.

# while loop: while read
cat records.txt | while read f
do
	echo "$f" 
done

# for example, upload a list of files to youtube
cat files |while read f
do
	youtube-upload --title="$i" "$i" --privacy=unlisted --playlist=CS231N-2017
done

# for loop
for i in *
do
	echo $i
done
