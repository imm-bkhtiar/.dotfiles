#!/bin/env bash

polybarStadeMode=$(cat $HOME/.cache/polybarState)
if [[ $polybarStadeMode != "music" ]]; then
  echo "music" > $HOME/.cache/polybarState 
  $HOME/.config/i3/polybarStateCheck.sh
else
  echo "default" > $HOME/.cache/polybarState 
  $HOME/.config/i3/polybarStateCheck.sh
fi
