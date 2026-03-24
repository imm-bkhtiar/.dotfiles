#!/usr/bin/bash

shopt -s nullglob

for file in "$@"; do
  echo "Memulai process: $file"
  unzip "$file"
  echo "process $file Selesai...."

done
