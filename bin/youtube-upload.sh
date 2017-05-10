#!/bin/sh

i=0
BEGIN=51
END=200
find "$1" -iname '*.mp4' | while read f
do
	let i++
	if [[ $i -ge $BEGIN && $i -le $END ]]; then
		#statements
		echo uploading ${i}th video: $(basename $f)
		#youtube-upload --title="${$(basename $f)%.*}" "$f" --playlist="$(basename '$(pwd)')"
	else
		echo "skipping ${i}th video: $(basename $f)"
	fi
done
