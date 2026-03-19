#!/bin/bash

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

case $XDG_SESSION_TYPE in
  "wayland")
    wf-recorder \
      --audio=alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
      --codec=libx264 \
      --pixel-format=yuv420p \
      --file=$HOME/Videos/screen_record/wf-$(date +%Y_%m_%d_%H_%M).mkv \
      --params="preset=ultrafast,crf=23,profile=main,level=4.0,b=8000k,bufsize=8000k"
  ;;
  "x11") 
    pkill mouseClicky.sh
    pkill mechvibes

    # sleep 0.5 
    # echo "enable virtual mouse & mechanical keyboard sound .... "
    # mechvibes &
    # $HOME/.dotfiles/personal/mouse-clicky/mouseClicky.sh &

    # ffmpeg -thread_queue_size 1024 \
    #   -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
    #   -f pulse -ac 1 -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
    #   -c:v h264 -preset superfast -b:v 8000k -bufsize 8000k -crf 23 \
    #   -profile:v main -level 4.0 -pix_fmt yuv420p \
    #   -c:a aac -b:a 128k -ar 48000 \
    #   -vsync cfr -async 1 \
    #   -movflags +faststart \
    #   $HOME/Videos/screen_record/ffmpeg-$(date +%Y_%m_%d_%H_%M).mkv
    
    # ffmpeg -thread_queue_size 1024 \
    #   -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
    #   -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
    #   -c:v libx264 -preset ultrafast -b:v 8000k \
    #   -crf 23 -pix_fmt yuv420p -threads:v 2 \
    #   -c:a aac -b:a 128k -threads:a 1\
    #   $HOME/Videos/screen_record/ffmpeg-$(date +%Y_%m_%d_%H_%M).mkv

    ffmpeg -thread_queue_size 1024 \
      -f x11grab -draw_mouse 1 -s 1366x768 -framerate 30 -i :0.0 \
      -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
      -c:v libx264rgb -preset ultrafast -crf 20 -b:v 8000k \
      -threads 4 -c:a aac -b:a 128k \
      $HOME/Videos/screen_record/ffmpeg-$(date +%Y_%m_%d_%H_%M).mkv

    # ffmpeg -vaapi_device /dev/dri/renderD128 -thread_queue_size 1024 \
    #   -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
    #   -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
    #   -vf 'format=nv12,hwupload' \
    #   -c:v h264_vaapi -qp 24 -preset ultrafast \
    #   -profile:v main \
    #   -c:a aac -b:a 128k -ar 48000 -ac 1 \
    #   $HOME/Videos/screen_record/ffmpeg-gpu-$(date +%Y_%m_%d_%H_%M).mkv

    pkill mechvibes
    pkill mouseClicky
  ;;
  * )
    echo "Gagal Memulai..."
    exit 1
  ;;
esac
