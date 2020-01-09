#!/bin/bash


ffmpeg -y -i bunny_short_14s.mov -c:v libx264 -c:a libfdk_aac transcoded_video.mp4

filesize=$(wc -c transcoded_video.mp4 | awk '{print $1}')

echo output video of $filesize generated

#ffprobe $app_dir/bunny_short_14s.mov
