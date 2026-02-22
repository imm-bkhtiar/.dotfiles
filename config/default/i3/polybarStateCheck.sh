#!/bin/env bash

polybarStateMode=$(grep "^mode=" $HOME/.cache/polybarState | cut -d "=" -f2)
polybarStatePowerBtn=$(grep "^powerBtn=" $HOME/.cache/polybarState | cut -d "=" -f2)

if [[ $polybarStatePowerBtn == "true" ]]; then
  polybar-msg action "#powerBtn.module_show"
else
  polybar-msg action "#powerBtn.module_hide"
fi

if [[ $polybarStateMode != "music" ]]; then
  polybar-msg action "#mpd.module_hide" 
  polybar-msg action "#mpd2.module_hide"

  polybar-msg action "#xwindow.module_show"
  polybar-msg action "#wlan.module_show"
  polybar-msg action "#cpu.module_show"
  polybar-msg action "#memory.module_show"
  polybar-msg action "#battery.module_show"
  polybar-msg action "#backlight.module_show"
  polybar-msg action "#pulseaudio.module_show"
  polybar-msg action "#date.module_show" 
else
  polybar-msg action "#mpd.module_show" 
  polybar-msg action "#mpd2.module_show"

  polybar-msg action "#xwindow.module_hide"
  polybar-msg action "#wlan.module_hide"
  polybar-msg action "#cpu.module_hide"
  polybar-msg action "#memory.module_hide"
  polybar-msg action "#battery.module_hide"
  polybar-msg action "#backlight.module_hide"
  polybar-msg action "#pulseaudio.module_hide"
  polybar-msg action "#date.module_hide" 
fi
