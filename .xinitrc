# autoload
xrdb $HOME/.Xresources

# load Pulse Module
pactl load-module module-bluetooth-discover

# Env Path
export XDG_DATA_DIRS="/usr/share:/usr/local/share"
export XDG_CURRENT_DESKTOP=generic
export XDG_SESSION_TYPE=x11

# window manager
# exec openbox-session
# exec sway
exec dbus-run-session -- i3

