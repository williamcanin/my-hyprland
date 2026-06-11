#!/usr/bin/env sh

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

# shellcheck disable=SC2034
WALLPAPER_PATH="$GET_HYPRPAPER_PATH"
# shellcheck disable=SC2034
HYPRLOCK_PATH="$GET_HYPRLOCK_PATH"

