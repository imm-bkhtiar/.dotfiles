#!/bin/bash

SOUND="$HOME/.dotfiles/personal/mouse-clicky/mouseClickSound.mp3"
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

echo "Menggunakan device: $DEVICE"

stdbuf -oL libinput debug-events --device "$DEVICE" | 
grep --line-buffered "POINTER_BUTTON.*pressed" | 
while read -r line; do
    echo "click"
    pw-play "$SOUND" &
done
