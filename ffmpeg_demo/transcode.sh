ffmpeg -i bunny_short_14s.mov -c:v libx264 -an transcoded_video_h264.mp4

filesize=$(wc -c transcoded_video_h264.mp4 | awk '{print $1}')

echo output video of $filesize generated

# Change codec to VP9-OPUS


#ffmpeg -i movietrailer_hq.webm -c:v libvpx -an transcoded_video_vp9.webm
#
#filesize=$(wc -c transcoded_video_vp9.webm | awk '{print $1}')
#
#echo output video of $filesize generated


