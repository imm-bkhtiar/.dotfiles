#!/bin/bash

OUT="/mnt/windows/Videos/Screen_Record"
DATE=$(date +%Y_%m_%d_%H_%M)
KEYBOARD_SOUND="$HOME/.local/wayvibes/soundpacks/cherrymx-brown-pbt"

GPU_MODE=false
WEBCAM=true
MIC=true

# ============== Audio Device ==================
# INTERNAL_AUDIO_DEVICE="alsa_output.pci-0000_00_14.2.analog-stereo.monitor"
INTERNAL_AUDIO_DEVICE="bluez_output.41_42_20_43_E8_BB.1.monitor"
MIC_DEVICE="alsa_input.hw_1_0"

# ============== Webcam Device ==================
WEBCAM_GPU_MODE=true
# WEBCAM_DEVICE="/dev/video0"
# WEBCAM_INPUT_FORMAT="yuyv422"
# WEBCAM_RESOLUTION="640x480"
WEBCAM_DEVICE="/dev/video2"
WEBCAM_INPUT_FORMAT="mjpeg"
WEBCAM_RESOLUTION="1280x720"


webcam(){
  # -------------- Webcam ------------------
  if [[ $WEBCAM_GPU_MODE == false ]]; then
    ffmpeg \
      -f v4l2 \
      -input_format $WEBCAM_INPUT_FORMAT \
      -video_size $WEBCAM_RESOLUTION  \
      -framerate 30 \
      -i $WEBCAM_DEVICE \
      -c:v libx264 \
      -preset ultrafast \
      "$OUT/webcam-$DATE.mkv" &
    echo $! > /tmp/campid
    return 0
  fi

  ffmpeg \
    -vaapi_device /dev/dri/renderD128 \
    -f v4l2 \
    -input_format $WEBCAM_INPUT_FORMAT \
    -video_size $WEBCAM_RESOLUTION \
    -framerate 30 \
    -i $WEBCAM_DEVICE \
    -vf 'format=nv12,hwupload' \
    -c:v h264_vaapi \
    -g 30 \
    -bf 0 \
    -b:v 5M \
    "$OUT/webcam-$DATE.mkv" &
  echo $! > /tmp/campid
}

mic(){
  # -------------- Mic ------------------
  ffmpeg -thread_queue_size 1024 \
    -f pulse \
    -i $MIC_DEVICE \
    -c:a aac \
    -b:a 128k \
    -ac 1 \
    "$OUT/mic-$DATE.m4a" &
  echo $! > /tmp/aupid
}

wayland_recorder(){
  wf-recorder \
    --audio="$INTERNAL_AUDIO_DEVICE" \
    --codec=libx264 \
    --pixel-format=yuv420p \
    --params="preset=ultrafast,crf=23,profile:v=main,level:v=4.0,b:v=5000k,bufsize=5000k" \
    --file=/mnt/windows/Videos/Screen_Record/wf-$(date +%Y_%m_%d_%H_%M).mkv
}

x11_recorder(){
  # -------------- Screen Record CPU ------------------
  if [[ $GPU_MODE == true ]]; then
    ffmpeg -vaapi_device /dev/dri/renderD128 -thread_queue_size 1024 \
      -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
      -f pulse -i bluez_output.41_42_20_43_E8_BB.1.monitor \
      -vf 'format=nv12,hwupload' \
      -c:v h264_vaapi -qp 20 -preset ultrafast -g 30 -bf 0 \
      -c:a aac -b:a 128k -ar 48000 -ac 1 \
      "$OUT/screen-$DATE.mkv" &
    echo $! > /tmp/recpid
    return 0
  fi

  ffmpeg -thread_queue_size 1024 \
    -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
    -f pulse -i $INTERNAL_AUDIO_DEVICE \
    -c:v libx264 -preset ultrafast -b:v 5000k -bufsize 5000k -crf 23 \
    -profile:v main -level 4.0 -pix_fmt yuv420p \
    -movflags +faststart \
    -c:a aac -b:a 128k -ac 1 \
    "$OUT/screen-$DATE.mkv" &
  echo $! > /tmp/recpid
}

record() {
  $HOME/.dotfiles/personal/mouse-clicky/mouseClicky.sh &

  if [[ $WEBCAM == true ]]; then
    webcam
    sleep 1
  fi

  if [[ $MIC == true ]]; then
    mic
  fi

  case $XDG_SESSION_TYPE in
    "wayland")
      wayvibes $KEYBOARD_SOUND --background 
      wayland_recorder
      ;;
    "x11") 
      rustyvibes $KEYBOARD_SOUND &
      x11_recorder
      ;;
    * )
      echo "Gagal Memulai..."
      exit 1
      ;;
  esac


  dunstify "recording STARTED"
}

end(){
  if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    pkill wayvibes
  fi
  pkill mouseClicky.sh
  pkill rustyvibes
  kill -15 "$(cat /tmp/recpid)" "$(cat /tmp/aupid)" "$(cat /tmp/campid)" && rm -f /tmp/recpid /tmp/aupid /tmp/campid
  dunstify "recording STOPED"
}

([[ -f /tmp/recpid ]] && end && exit 0) || record
