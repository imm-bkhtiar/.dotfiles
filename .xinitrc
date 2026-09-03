# autoload
xrdb $HOME/.Xresources

# load Pulse Module
pactl load-module module-bluetooth-discover

# Env Path
export XDG_DATA_DIRS="/usr/share:/usr/local/share"
export XDG_CURRENT_DESKTOP=generic
export XDG_SESSION_TYPE=x11
# export QT_QPA_PLATFORMTHEME=qt6ct

case "$WM" in
    i3)
        exec dbus-run-session -- i3
        ;;

    openbox)
        exec dbus-run-session -- openbox-session
        ;;

    bspwm)
        exec dbus-run-session -- bspwm
        ;;
esac
