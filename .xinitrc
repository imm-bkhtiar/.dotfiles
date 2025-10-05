# services
# load Pulse Module
pactl load-module module-bluetooth-discover

# Env Path
export XDG_DATA_DIRS="/usr/share:/usr/local/share:$HOME/.local/share:/var/lib/flatpak/exports/share:/$HOME/.local/share/flatpak/exports/share"

# window manager
# exec startfluxbox
exec i3
