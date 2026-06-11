#!/usr/bin/env sh

HYPRPAPER_FILE="$HOME/.config/hypr/hyprpaper.conf"

HYPRPAPER_PATH=$(
  sed -n "s|^[[:space:]]*path[[:space:]]*=[[:space:]]*~|$HOME|p" \
  "$HYPRPAPER_FILE" |
  head -n1
)

# shellcheck disable=SC2034
WALLPAPER_PATH="$HYPRPAPER_PATH"
