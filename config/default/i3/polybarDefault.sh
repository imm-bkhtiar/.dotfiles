#!/bin/env bash

polybar-msg action "#mpd.module_hide" 
polybar-msg action "#mpd2.module_hide"
polybar-msg action "#powerBtn.module_hide"

polybar-msg action "#xwindow.module_show"
polybar-msg action "#wlan.module_show"
polybar-msg action "#cpu.module_show"
polybar-msg action "#memory.module_show"
polybar-msg action "#battery.module_show"
polybar-msg action "#pulseaudio.module_show"
polybar-msg action "#date.module_show" 
