#!/usr/bin/zsh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do
  sleep 1; 
done

cacheFileState=$HOME/.cache/polybarState
touch $cacheFileState
printf "mode=default\npowerBtn=false" > $cacheFileState

# Launch polybar
polybar &
sleep 0.2
$HOME/.config/i3/polybarStateCheck.sh
