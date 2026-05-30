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
    pkill wayvibes
    pkill mouseClickyWayland.sh

    sleep 0.5
    wayvibes $HOME/.local/wayvibes/soundpacks/cherrymx-red-abs --background 
    $HOME/.dotfiles/personal/mouse-clicky/mouseClickyWayland.sh &

    wf-recorder \
      --audio=alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
      --codec=libx264 \
      --pixel-format=yuv420p \
      --file=$HOME/Videos/screen_record/wf-$(date +%Y_%m_%d_%H_%M).mkv \
      --params="preset=ultrafast,crf=23,profile:v=main,level:v=4.0,b:v=8000k,bufsize=8000k"

    pkill wayvibes
    pkill mouseClickyWayland.sh
  ;;
  "x11") 
    pkill mouseClicky.sh
    pkill mechvibes

    sleep 0.5 
    mechvibes &
    $HOME/.dotfiles/personal/mouse-clicky/mouseClicky.sh &
    
    # CPU Recording ------------
    ffmpeg -thread_queue_size 1024 \
      -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
      -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
      -c:v libx264 -preset ultrafast -b:v 5000k -bufsize 5000k -crf 23 \
      -profile:v main -level 4.0 -pix_fmt yuv420p \
      -movflags +faststart \
      -c:a aac -b:a 128k -ac 1 \
      $HOME/Videos/screen_record/ffmpeg-$(date +%Y_%m_%d_%H_%M).mkv

    # GPU Recording ------------
    # ffmpeg -vaapi_device /dev/dri/renderD128 -thread_queue_size 1024 \
    #   -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
    #   -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
    #   -vf 'format=nv12,hwupload' \
    #   -c:v h264_vaapi -qp 28 -preset ultrafast -g 30 -bf 0 \
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
