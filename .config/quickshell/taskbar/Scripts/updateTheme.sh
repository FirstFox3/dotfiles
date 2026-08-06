#!/bin/sh

ffmpeg -i "$1" -vframes 1 /usr/share/wallpapers/custom/frameOne.jpg
matugen image /usr/share/wallpapers/custom/frameOne.jpg --prefer value
