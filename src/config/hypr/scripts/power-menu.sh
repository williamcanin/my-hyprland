#!/usr/bin/env sh

# shellcheck disable=SC1091
. "$HOME/.config/hypr/scripts/base.sh"

do_lock() {
  IMG="/tmp/hyprlock-wallpaper-blur.png"
  if [ ! -f "$IMG" ] || [ "$WALLPAPER_PATH" -nt "$IMG" ]; then
    magick "$WALLPAPER_PATH" \
      -blur 0x2 \
      -fill black -colorize 20% \
      "$IMG"
  fi
  exec hyprlock
}

# -- power-menu.sh --lock
# Also used for the keyboard shortcut Mod+Shift+l
# ------------------------------------------------------------------------------
[ "$1" = "--lock" ] && {
  do_lock
  exit $?
}

# -- Translate -----------------------------------------------------------------
case "${LC_MESSAGES:-${LANG:-en}}" in
pt*)
  LOCK="Bloquear"
  SUSPEND="Suspender"
  LOGOUT="Sair"
  REBOOT="Reiniciar"
  SHUTDOWN="Desligar"
  ;;
*)
  LOCK="Lock"
  SUSPEND="Suspend"
  LOGOUT="Log Out"
  REBOOT="Reboot"
  SHUTDOWN="Shut Down"
  ;;
esac

# -- Menu rofi -----------------------------------------------------------------
CHOICE=$(printf '%s\n' \
  "$LOCK" \
  "$SUSPEND" \
  "$LOGOUT" \
  "$REBOOT" \
  "$SHUTDOWN" |
  rofi \
    -dmenu \
    -p ">" \
    -theme-str 'window {width: 220px;}' \
    -theme-str 'listview {lines: 5;}' \
    -no-custom \
    -i)

# ── Despatch ------------------------------------------------------------------
case "$CHOICE" in
"$LOCK")     do_lock ;;
"$SUSPEND")  systemctl suspend ;;
"$LOGOUT")   hyprshutdown ;; # hyprctl dispatch exit
"$REBOOT")   hyprshutdown -t 'Reiniciando...' --post-cmd 'reboot' ;; # systemctl reboot
"$SHUTDOWN") hyprshutdown -t 'Desligando...' --post-cmd 'shutdown -P 0' ;; # systemctl poweroff
esac
