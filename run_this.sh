#!/bin/bash

# ln -sf $HOME/.dotfiles/config/default/* $HOME/.config/

app=(
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
  "https://download.kde.org/Attic/krita/4.4.8/krita-4.4.8-x86_64.appimage"
)

for i in "${!app[@]}"; do
  echo "$i : ${app[$i]}"
done

# printf "The compositor ? \n1. X11 \n2. Wayland \n : "
# read compositor
#
# printf "do you want add config to super user ? (y/n) : "
# read addsu
#
# if [[ $compositor == 1 ]]; then
#   ln -sf $HOME/.dotfiles/config/default/* $HOME/.config/
# elif [[ $compositor == 2 ]]; then
#   ln -sf $HOME/.dotfiles/config/additional/
# fi
