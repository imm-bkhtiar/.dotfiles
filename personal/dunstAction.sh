#!/bin/bash

STEP=5
SINK="@DEFAULT_SINK@"
NOTIFY_ID=9912

case "$2" in
    up)
        if [[ $1 == "volume" ]]; then
          wpctl set-volume "$SINK" "${STEP}%+" --limit 1.0
        else
          brightnessctl set +5%
        fi
        ;;
    down)
        if [[ $1 == "volume" ]]; then
          wpctl set-volume "$SINK" "${STEP}%-" --limit 1.0
        else
          brightnessctl set 5%-
        fi
        ;;
    mute)
        if [[ $1 == "volume" ]]; then
          wpctl set-mute "$SINK" toggle
        fi
        ;;
    *)
        exit 1
        ;;
esac

# Ambil volume
if [[ $1 == "volume" ]]; then
  VALUE=$(pactl get-sink-volume "$SINK" | head -n1 | grep -o '[0-9]\+%' | head -n1 | tr -d '%')
else
    CURRENT=$(brightnessctl get)
    MAX=$(brightnessctl max)
    VALUE=$((CURRENT * 100 / MAX))
fi

# Status mute
MUTED=$(pactl get-sink-mute "$SINK" | awk '{print $2}')

if [[ $1 == "volume" ]]; then
  if [ "$MUTED" = "yes" ]; then
    ICON="🔇"
    TEXT="Muted"
    TITLE=Volume
  else
    ICON="🔊"
    TEXT="${VOLUME}%"
    TITLE=Volume
  fi
else
    ICON="󰃠 "
    TEXT="Brightness"
    TITLE=Brightness
fi

# Progress bar
BAR_LENGTH=20
FILLED=$((VALUE * BAR_LENGTH / 100))
EMPTY=$((BAR_LENGTH - FILLED))

BAR=$(printf '%0.s█' $(seq 1 "$FILLED"))
BAR+=$(printf '%0.s░' $(seq 1 "$EMPTY"))

dunstify \
    -a $TITLE \
    -r "$NOTIFY_ID" \
    -u low \
    "$ICON $TITLE" \
    "$BAR\n$TEXT" \
    -h int:value:"$VALUE" \
    -t 1200

