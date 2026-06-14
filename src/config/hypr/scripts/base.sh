#!/usr/bin/env sh

# shellcheck disable=SC2034

HYPRPAPER_FILE="$HOME/.config/hypr/hyprpaper.conf"
HYPRLOCK_FILE="$HOME/.config/hypr/hyprlock.conf"

GET_HYPRPAPER_PATH=$(
  sed -n "s|^[[:space:]]*path[[:space:]]*=[[:space:]]*~|$HOME|p" \
  "$HYPRPAPER_FILE" |
  head -n1
)

GET_HYPRLOCK_PATH=$(
  sed -n 's/^[[:space:]]*path[[:space:]]*=[[:space:]]*//p' \
  "$HYPRLOCK_FILE" |
  head -n1
)

WALLPAPER_PATH="$GET_HYPRPAPER_PATH"
HYPRLOCK_PATH="$GET_HYPRLOCK_PATH"



# -- Set variables global ------------------------------------------------------
# Button Layout restored usage: appmenu:minimize,maximize,close
BUTTON_LAYOUT=":"
GTK_THEME="Adwaita-dark"
GTK_ICON_THEME="Yaru-prussiangreen-dark"
GTK_CURSOR="Adwaita"
