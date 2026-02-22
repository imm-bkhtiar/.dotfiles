#!/bin/env bash

polybarStateMode=$(grep "^mode=" $HOME/.cache/polybarState | cut -d "=" -f2)
polybarStatePowerBtn=$(grep "^powerBtn=" $HOME/.cache/polybarState | cut -d "=" -f2)
case "$1" in
  "toggle-power")
    if [[ $polybarStatePowerBtn != "true" ]]; then
      sed -i "s/^powerBtn=.*/powerBtn=true/" $HOME/.cache/polybarState
      $HOME/.config/i3/polybarStateCheck.sh
    else
      sed -i "s/^powerBtn=.*/powerBtn=false/" $HOME/.cache/polybarState
      $HOME/.config/i3/polybarStateCheck.sh
    fi
  ;;
  "toggle-mode")
    if [[ $polybarStateMode != "music" ]]; then
      sed -i "s/^mode=.*/mode=music/" $HOME/.cache/polybarState
      $HOME/.config/i3/polybarStateCheck.sh
    else
      sed -i "s/^mode=.*/mode=default/" $HOME/.cache/polybarState
      $HOME/.config/i3/polybarStateCheck.sh
    fi
  ;;
esac

