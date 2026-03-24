#!/bin/bash

# Install Default APP For me
TARGET_APPS_DIRECTORY="./apps/"
APPS=(
  "https://github.com/audacity/audacity/releases/download/Audacity-3.7.7/audacity-linux-3.7.7-x64-22.04.AppImage"
  "https://github.com/usebruno/bruno/releases/download/v3.2.0/bruno_3.2.0_amd64_linux.deb"
  "https://download.kde.org/Attic/kdenlive/22.12/linux/kdenlive-22.12.3-x86_64.AppImage"
  "https://download.kde.org/Attic/krita/4.2.0/krita-4.2.0-x86_64.appimage"
  "https://github.com/friction2d/friction/releases/download/v1.0.0-rc.3/Friction-1.0.0-rc.3-x86_64.AppImage"
  "https://github.com/hainguyents13/mechvibes/releases/download/v2.3.6/Mechvibes-2.3.6-hotfix.AppImage"
  "https://download.gimp.org/gimp/v3.2/linux/GIMP-3.2.0-x86_64.AppImage"
  "https://github.com/yt-dlp/yt-dlp/releases/download/2026.03.17/yt-dlp"
  "https://github.com/ONLYOFFICE/appimage-desktopeditors/releases/download/v9.3.1/DesktopEditors-x86_64.AppImage"
  # Additional Purpose -------
  # "https://github.com/LibreSprite/LibreSprite/releases/download/v1.0/libresprite-Linux--x86_64.AppImage"
  # "https://github.com/localsend/localsend/releases/download/v1.17.0/LocalSend-1.17.0-linux-x86-64.AppImage"
  # "https://github.com/jgraph/drawio-desktop/releases/download/v29.6.1/drawio-x86_64-29.6.1.AppImage"
  # "https://github.com/flameshot-org/flameshot/releases/download/v13.3.0/Flameshot-13.3.0.x86_64.AppImage"
  # "https://github.com/ventoy/Ventoy/releases/download/v1.1.10/ventoy-1.1.10-linux.tar.gz"
  # "https://dbeaver.io/files/dbeaver-ce-latest-linux-x86_64.tar.gz"
  # "https://github.com/godotengine/godot/releases/download/4.6.1-stable/Godot_v4.6.1-stable_mono_linux_x86_64.zip"
  # "https://github.com/godotengine/godot/releases/download/3.6.2-stable/Godot_v3.6.2-stable_mono_x11_64.zip"
  # "https://github.com/mltframework/shotcut/releases/download/v26.2.26/shotcut-linux-x86_64-26.2.26.AppImage"
)

mkdir -p ./apps

for APP in "${APPS[@]}"; do
  sleep 0.5
  printf "Downloading $APP ..... "
  wget "$APP" -P "$TARGET_APPS_DIRECTORY"
  printf "\n"
  sleep 0.5
done

if [[ $XDG_SESSION_TYPE == "x11" ]]; then
  echo "Hello World"
else
  echo "World Hello"
fi

