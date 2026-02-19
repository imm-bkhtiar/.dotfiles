#!/bin/env bash
rodir="$HOME/.config/rofi/modules/powerMenu/img"
selected=$(
  {
    printf "Shutdown\x00icon\x1f%s\n" "$rodir/power.svg"
    printf "Restart\x00icon\x1f%s\n" "$rodir/restart.svg"
    printf "Sleep\x00icon\x1f%s\n" "$rodir/sleep.svg"
    printf "Logout\x00icon\x1f%s\n" "$rodir/logout.svg"
  } | rofi \
    -dmenu -me-select-entry "" \
    -show-icons \
    -no-custom \
    -p "Power Menu" \
    -theme "$HOME/.config/rofi/config_power.rasi" \
    -me-accept-entry MousePrimary
)

confirm() {
  msg="$1"
  answer=$(printf "Yes\nNo" | rofi \
    -dmenu -me-select-entry "" \
    -mesg "$msg" \
    -show-icons \
    -no-custom \
    -me-accept-entry MousePrimary \
    -theme "$HOME/.config/rofi/config_confirm.rasi"
  )
  [[ "$answer" = "Yes" ]]
}

case "$selected" in
  Shutdown)
    sleep .1
    if confirm "Apakah yakin akan SHUTDOWN ?"; then
      systemctl poweroff 
    fi
  ;;
  Restart) 
    sleep .1
    if confirm "Apakah yakin akan RESTART ?"; then
      systemctl reboot
    fi
  ;;
  Sleep) systemctl suspend;;
  Logout)
    sleep .1
    if confirm "Apakah yakin akan LOGOUT ?"; then
      i3-msg exit
    fi
  ;;
esac
