#!/usr/bin/zsh

# Terminate already running bar instances
killall -q waybar

cacheFileState=$HOME/.cache/polybarState

if [[ ! -f $cacheFileState ]]; then
  touch $cacheFileState
  printf "mode=default\npowerBtn=false" > $cacheFileState
fi

# Launch polybar
waybar
$HOME/.config/waybar/waybarStateCheck.sh
