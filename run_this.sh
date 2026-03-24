#!/bin/bash

# Install Default APP For me
APPS=(
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
)

for APP in "${APPS[@]}"; do
  echo "Downloading $APP ..... "
  sleep 0.5
done

if [[ $XDG_SESSION_TYPE == "x11" ]]; then
  echo "Hello World"
else
  echo "World Hello"
fi

