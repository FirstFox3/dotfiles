#!/bin/sh

ffmpeg -i "$1" -vframes 1 $XDG_STATE_HOME/frameOne.jpg
matugen image $XDG_STATE_HOME/frameOne.jpg --prefer value
rm $XDG_STATE_HOME/frameOne.jpg
