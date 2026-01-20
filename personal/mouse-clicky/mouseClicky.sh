#!/bin/bash

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

SOUND="$HOME/.dotfiles/personal/mouse-clicky/mouseClickSound.mp3"

xinput test "$DEVICE_ID" \
| grep --line-buffered "button press   1\|button press   3" \
| while read -r _; do
    pw-play "$SOUND" &
done
