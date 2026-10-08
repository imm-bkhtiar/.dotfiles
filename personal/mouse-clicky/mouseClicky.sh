#!/bin/bash
SOUND="$HOME/.dotfiles/personal/mouse-clicky/mouseClickSound.mp3"


case $XDG_SESSION_TYPE in
  "wayland")
    DEVICE=$(libinput list-devices | awk '
      /^Device:/ { 
          dev_name=$0 
        }
      /^Kernel:/ { 
        dev_path=$2 
      }
      /^Capabilities:/ { 
        if ($0 ~ /pointer/) {
          print dev_path;
          exit; 
        }
      }
    ')

  if [[ -z "$DEVICE" ]]; then
    echo "Mouse tidak ditemukan!"
    exit 1
  fi

  stdbuf -oL libinput debug-events --device "$DEVICE" | 
  grep --line-buffered "POINTER_BUTTON.*pressed" | 
  while read -r line; do
    pw-play "$SOUND" &
  done
  ;;
  "x11")
  get_mouse_id() {
    xinput list |
      grep -i "slave  pointer" |
      grep -Ei "mouse|usb|logitech|razer|steelseries" |
      sed -n 's/.*id=\([0-9]\+\).*/\1/p' |
      head -n1
    }

  DEVICE_ID=$(get_mouse_id)

  if [[ $DEVICE_ID == "" ]]; then
    DEVICE_ID=$(xinput list |
      grep -i "touchpad" |
      sed -n 's/.*id=\([0-9]\+\).*/\1/p')
  fi

  xinput test "$DEVICE_ID" \
    | grep --line-buffered "button press   1\|button press   3" \
    | while read -r _; do
        pw-play "$SOUND" &
      done
  ;;
  *)
  exit 1
  ;;
esac
