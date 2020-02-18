ffmpeg -i bunny_short_14s.mov -c:v libx264 -an -vf scale=1280:720 out_h264.mp4

filesize=$(wc -c out_h264.mp4 | awk '{print $1}')

echo output video of $filesize generated
