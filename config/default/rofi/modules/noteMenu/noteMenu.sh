#!/bin/env bash

rodir="$HOME/BAKHTIAR/note"
selected=$(find $rodir -type f ! -name ".*" | \
  while read -r full; do 
    name=$(basename "$full")
    printf "$name\x00icon\x1f%s\n" "$HOME/.config/rofi/modules/noteMenu/img/note.svg"
  done | \
  rofi -dmenu -i -p "My Note" -theme $HOME/.config/rofi/config_flat.rasi)

if [[ $selected != "" ]]; then
  kitty sh -c "nvim '$rodir/$selected'"
else
  exit
fi

