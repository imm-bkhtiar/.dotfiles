#!/usr/bin/zsh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do
  sleep 1; 
done

touch $HOME/.cache/polybarState

# Launch polybar
polybar &
sleep 0.2
$HOME/.config/i3/polybarStateCheck.sh
