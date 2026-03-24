#!/bin/env bash

polybarStateMode=$(grep "^mode=" $HOME/.cache/polybarState | cut -d "=" -f2)
polybarStatePowerBtn=$(grep "^powerBtn=" $HOME/.cache/polybarState | cut -d "=" -f2)

if [[ $polybarStatePowerBtn == "true" ]]; then
  echo "[ 󰐥 ]"
  pkill -SIGRTMIN+11 waybar
fi

if [[ $polybarStateMode == "music" ]]; then
  pkill -SIGRTMIN+10 waybar
else
  pkill -SIGRTMIN+1 waybar
fi
