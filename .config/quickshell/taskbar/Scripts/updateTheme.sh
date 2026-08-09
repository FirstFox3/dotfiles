#!/bin/sh

ffmpeg -i "$1" -vframes 1 /usr/share/wallpapers/frameOne.jpg
matugen image /usr/share/wallpapers/frameOne.jpg --prefer value
