#!/bin/env bash

function start { sudo systemctl start $1 }
function status { sudo systemctl status $1 }
function stop { sudo systemctl stop $1 }
function restart { sudo systemctl restart $1 }
function enable { sudo systemctl enable $1 }
function disable { sudo systemctl disable $1 }
function ustart { systemctl --user start $1 }
function ustatus { systemctl --user status $1 }
function ustop { systemctl --user stop $1 }
function urestart { systemctl --user restart $1 }
function uenable { systemctl --user enable $1 }
function udisable { systemctl --user disable $1 }

function record() {
  $HOME/Videos/record.sh
}

function coding() {
  coding_dir="$HOME/BAKHTIAR/source-code/"
  coding_selected_raw=$(find "$coding_dir" -maxdepth 1 -mindepth 1 -type d | fzf --height 40% --reverse --print-query)

  query=$(echo "$coding_selected_raw" | sed -n '1p')
  selected=$(echo "$coding_selected_raw" | sed -n '2p')  

  
  if [[ -d "$selected" && -n "$selected" ]]; then
    tmux new-session -A -c "$selected" "nvim ."
  elif [[ "$query" != "" ]]; then
    mkdir "$coding_dir/$query" && tmux new-session -A -c "$selected" \; send-keys "nvim ." C-m 
  else
    cd "$coding_dir"
  fi
}

function yd() {
  yt-dlp -S vcodec:avc,res:720,ext:mp4 $1 --cookies-from-browser chromium:$HOME/.local/share/qutebrowser --js-runtime node -o "/mnt/windows/Videos/Youtube/%(title)s.%(ext)s"
  # yt-dlp -S vcodec:avc,res:720,ext:mp4 $1 --cookies-from-browser firefox:$HOME/.mozilla/firefox/ --js-runtime node -o "$HOME/Videos/Youtube/%(title)s.%(ext)s"
}

function yma() {
  yt-dlp -x --audio-format mp3 "$1" \
    --embed-metadata \
    --embed-thumbnail \
    --cookies-from-browser chromium:$HOME/.local/share/qutebrowser \
    --js-runtime node \
    -o "/mnt/windows/Music/Youtube/%(title)s.%(ext)s"  
  # yt-dlp -S vcodec:avc,res:720,ext:mp4 $1 --cookies-from-browser firefox:$HOME/.mozilla/firefox/ --js-runtime node -o "$HOME/Videos/Youtube/%(title)s.%(ext)s"
}

function btw() {
  echo "Setting Boot To Windows ( BTW ) Next"
  sleep 2
  sudo efibootmgr -n 0000
  sleep 1
  echo "Succes..., Time to BTW (Boot To Windows)"
}
