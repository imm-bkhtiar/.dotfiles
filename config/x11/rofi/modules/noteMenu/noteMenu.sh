#!/bin/env bash

rodir="$HOME/BAKHTIAR/note"
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
  mapfile -t files < <(find "$rodir" -type f ! -name ".*" | sort)

  selected=$(
    printf '%s\n' "${files[@]}" |
      while read -r file; do
        printf '%s\0icon\x1fnote\n' "$(basename "$file")"
      done |
        fuzzel --dmenu --prompt="My Note > "
      )
elif [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
  selected=$(find $rodir -type f ! -name ".*" | \
    while read -r full; do 
      name=$(basename "$full")
      printf "$name\x00icon\x1f%s\n" "$HOME/.config/rofi/modules/noteMenu/img/note.svg"
    done | \
      rofi -dmenu -i -p "My Note" -theme $HOME/.config/rofi/config_flat.rasi)
fi

if [[ $selected != "" ]]; then
  kitty --title "MyNote" sh -c "nvim '$rodir/$selected'"
else
  exit
fi
