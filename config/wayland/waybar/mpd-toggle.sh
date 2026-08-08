#!/usr/bin/env bash

if [[ $1 == "toggle" ]]; then
  status=$(mpc status %state%)
  if [[ $status == "playing" ]]; then
    echo ""
  elif [[ $status == "paused" ]]; then
    echo ""
  else
    echo ""
  fi
elif [[ $1 == "prev" ]]; then
  if mpc status >/dev/null 2>&1 && [ -n "$(mpc current)" ]; then
    echo " "
  fi
elif [[ $1 == "next" ]]; then
  if mpc status >/dev/null 2>&1 && [ -n "$(mpc current)" ]; then
    echo "" 
  fi
elif [[ $1 == "stop" ]]; then
  if mpc status >/dev/null 2>&1 && [ -n "$(mpc current)" ]; then
    echo ""
  fi
fi


