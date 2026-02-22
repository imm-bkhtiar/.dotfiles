#!/bin/env bash

polybarStadeMode=$(cat $HOME/.cache/polybarState)
if [[ $polybarStadeMode != "music" ]]; then
  polybar-msg action "#mpd.module_hide" 
  polybar-msg action "#mpd2.module_hide"
  polybar-msg action "#powerBtn.module_hide"

  polybar-msg action "#xwindow.module_show"
  polybar-msg action "#wlan.module_show"
  polybar-msg action "#cpu.module_show"
  polybar-msg action "#memory.module_show"
  polybar-msg action "#battery.module_show"
  polybar-msg action "#backlight.module_show"
  polybar-msg action "#pulseaudio.module_show"
  polybar-msg action "#date.module_show" 
  polybar-msg action "#powerBtn.module_hide"
else
  polybar-msg action "#mpd.module_show" 
  polybar-msg action "#mpd2.module_show"
  polybar-msg action "#powerBtn.module_show"

  polybar-msg action "#xwindow.module_hide"
  polybar-msg action "#wlan.module_hide"
  polybar-msg action "#cpu.module_hide"
  polybar-msg action "#memory.module_hide"
  polybar-msg action "#battery.module_hide"
  polybar-msg action "#backlight.module_hide"
  polybar-msg action "#pulseaudio.module_hide"
  polybar-msg action "#date.module_hide" 
  polybar-msg action "#powerBtn.module_hide"
fi
