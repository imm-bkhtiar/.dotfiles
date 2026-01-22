#!/bin/bash

pkill mouseClicky.sh
pkill mechvibes

sleep 0.5 
mechvibes &
$HOME/.dotfiles/personal/mouse-clicky/mouseClicky.sh &
# ffmpeg -thread_queue_size 1024 \
#   -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
#   -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
#   -f pulse -i alsa_input.hw_1_0 \
#   -filter_complex "[1:a]volume=1[a1];[2:a]volume=7.5[a2];[a1][a2]amix[aout]" \
#   -map 0:v -map "[aout]" \
#   -c:v h264 -preset ultrafast -b:v 8000k -bufsize 8000k -crf 23 \
#   -profile:v main -level 4.0 -pix_fmt yuv420p \
#   -c:a aac -b:a 160k -ar 48000 -ac 1 \
#   -movflags +faststart \
#   $HOME/Videos/screen_record/ffmpeg-audio-$(date +%Y_%m_%d_%H_%M).mkv

# ffmpeg -thread_queue_size 1024 \
#   -f x11grab -video_size 1366x768 -framerate 30 -i :0.0 \
#   -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
#   -f pulse -i alsa_input.pci-0000_00_14.2.analog-stereo \
#   -vf "scale=1280x720" \
#   -c:v h264 -preset veryfast -b:v 10M -bufsize 10M -maxrate 10M -crf 20 \
#   -profile:v main -level 4.1 -pix_fmt yuv420p \
#   -c:a aac -b:a 160k -ar 48000 -ac 1 \
#   -movflags +faststart \
#   $HOME/Videos/screen_record/ffmpeg-video-$(date +%Y_%m_%d_%H_%M).mkv \
#   -map 2:a \
#   -c:a pcm_s16le -b:a 160k -ar 48000 -ac 1 \
#   $HOME/Videos/screen_record/ffmpeg-audio-$(date +%Y_%m_%d_%H_%M).wav

# ffmpeg -thread_queue_size 1024 \
#   -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
#   -f pulse -i bluez_output.41_42_20_43_E8_BB.1.monitor \
#   -vf "scale=1280x720" \
#   -c:v h264 -preset ultrafast -b:v 8000k -bufsize 8000k -crf 23 \
#   -profile:v main -level 4.0 -pix_fmt yuv420p \
#   -c:a aac -b:a 160k -ar 48000 -ac 1 \
#   -movflags +faststart \
#   $HOME/Videos/screen_record/ffmpeg-audio-$(date +%Y_%m_%d_%H_%M).mkv

# ffmpeg -thread_queue_size 1024 \
#   -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
#   -f pulse -i alsa_input.hw_1_0 \
#   -c:v h264 -preset ultrafast -b:v 8000k -bufsize 8000k -crf 23 \
#   -profile:v main -level 4.0 -pix_fmt yuv420p \
#   -c:a aac -b:a 160k -ar 48000 -ac 1 \
#   -movflags +faststart \
#   $HOME/Videos/screen_record/ffmpeg-audio-$(date +%Y_%m_%d_%H_%M).mkv

ffmpeg -thread_queue_size 1024 \
  -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
  -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
  -c:v h264 -preset ultrafast -b:v 8000k -bufsize 8000k -crf 23 \
  -profile:v main -level 4.0 -pix_fmt yuv420p \
  -c:a aac -b:a 160k -ar 48000 -ac 1 \
  -movflags +faststart \
  $HOME/Videos/screen_record/ffmpeg-audio-$(date +%Y_%m_%d_%H_%M).mkv

pkill mechvibes
pkill mouseClicky
