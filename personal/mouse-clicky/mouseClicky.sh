#!/bin/bash

DEVICE_ID=14
SOUND="./mouseClickSound.mp3"

# xinput test "$DEVICE_ID" | while read -r line; do
#     if echo "$line" | grep -qE "button press\s+(1|3)"; then
#         pw-play "$SOUND" &
#     fi
# done

xinput test "$DEVICE_ID" \
| grep --line-buffered "button press   1\|button press   3" \
| while read -r _; do
    pw-play "$SOUND" &
done
