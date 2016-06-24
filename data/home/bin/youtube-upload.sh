#!/bin/sh

find "$1" -iname '*.mp4' | while read f
do
    echo $(basename $f)
    youtube-upload --title="$(basename $f)" "$f"
done
