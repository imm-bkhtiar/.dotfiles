#!/bin/env bash

rodir="/mnt/windows/Videos/$1"

if [[ $1 == "Music" ]]; then
  rodir="/mnt/windows/Music"
fi

if [[ $1 == "Anime" || $1 == "Series" || $1 == "Music" ]]; then 
  mapfile -t files < <(find "$rodir" -mindepth 1 -maxdepth 1 \( -type d -o -type f \) ! \( -name ".*" -o -name "*.rar" \) | sort)
else
  mapfile -t files < <(find "$rodir" -type f ! -name ".*" | sort)
fi

selected=$(
  printf '%s\n' "${files[@]}" |
    while read -r file; do
      printf "%s\0icon\x1f$1\n" "$(basename "$file")"
    done |
      fuzzel --dmenu --width 80 --prompt="MPV > "
)

if [[ $selected != "" && $1 != "Music" ]]; then
  mpv "$rodir/$selected"
elif [[ $selected != "" && $1 == "Music" ]]; then
  systemctl --user start mpd
  mpc update
  mpc clear
  mpc add "$selected"
  mpc play
else
  exit
fi
