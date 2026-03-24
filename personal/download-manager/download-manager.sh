#!/bin/env bash

DOWNLOAD_DIR="$HOME/Downloads"
find $DOWNLOAD_DIR -maxdepth 1 -maxdepth 1 -type f | while read -r FILE; do
  EXT="${FILE##*.}"
  FILENAME=$(basename "$FILE")

  if [[ "$FILENAME" == "$EXT" ]]; then
    continue
  fi

  case $EXT in
    appimage|deb)
      TARGET="Program"
      ;;
    mp4|mkv)
      TARGET="Video"
      ;;
    mp3|mp4a)
      TARGET="Music"
      ;;
    pdf|odt|docx|xlsx|txt)
      TARGET="Document"
      ;;
    7z|zip|rar)
      TARGET="Compressed"
      ;;
    png|jpg|svg)
      TARGET="Picture"
      ;;
    *)
      echo "Skip $FILENAME | $EXT: Tidak ada target folder"
      continue 
      ;;
  esac

  echo "Info: Moving $FILE into target dir....." 
  sleep 0.3

  mkdir -p "$DOWNLOAD_DIR/$TARGET"
  mv "$FILE" "$DOWNLOAD_DIR/$TARGET/"

  echo "Success: Managing $FILE" 
done
