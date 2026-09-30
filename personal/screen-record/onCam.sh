#!/bin/env bash

mpv --title="webcam" \
  --profile=low-latency \
  --untimed \
  --demuxer-lavf-format=video4linux2 \
  /dev/video0
