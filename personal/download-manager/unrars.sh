#!/usr/bin/bash

shopt -s nullglob

rars=( *.rar )

echo "ketemu ${files[@]} file"

for rar in "${rars[@]}"; do
  echo "Memulai process: $rar"
  unrar x "$rar"
  echo "process $rar Selesai...."

done
