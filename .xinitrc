# autoload
xrdb $HOME/.Xresources

# load Pulse Module
pactl load-module module-bluetooth-discover

# Env Path
export XDG_DATA_DIRS="/usr/share:/usr/local/share"

# window manager
# exec startfluxbox
exec i3
