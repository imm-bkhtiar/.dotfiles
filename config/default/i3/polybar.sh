#!/usr/bin/zsh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do
  echo true
  sleep 1; 
done

# Launch polybar
polybar &
sleep 0.2
$HOME/.config/i3/polybarDefault.sh
polybar-msg action "#powerBtn.module_hide"
