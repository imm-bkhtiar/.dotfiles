#!/bin/bash

check_pid() {
    [[ -f "$1" ]] && kill -0 "$(cat "$1")" 2>/dev/null
}

if check_pid /tmp/recpid; then
    REC="%{F#00ff00}󰑊 REC%{F-}"
else
    REC=""
fi

if check_pid /tmp/aupid; then
    MIC="%{F#00ff00}󰍬 MIC%{F-}"
else
    MIC=""
fi

if check_pid /tmp/campid; then
    CAM="%{F#00ff00}󰖠 CAM%{F-}"
else
    CAM=""
fi

echo "$REC   $MIC   $CAM"
