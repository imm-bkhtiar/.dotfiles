#!/bin/env bash

rodir="$HOME/.config"
selected=$(find $rodir -mindepth 1 -maxdepth 1 \( -type d -o -type l \) | \
  while read -r full; do 
    name=$(basename "$full")
    printf "$name\x00icon\x1f%s\n" "$HOME/.config/rofi/modules/configMenu/img/config.svg"
  done | \
  rofi -dmenu -i -p "Config" -theme $HOME/.config/rofi/config_flat.rasi)

if [[ $selected != "" ]]; then
  kitty sh -c "nvim '$rodir/$selected'"
else
  exit
fi

