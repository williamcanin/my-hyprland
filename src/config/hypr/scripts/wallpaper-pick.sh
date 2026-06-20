#!/usr/bin/env sh

. "$HOME/.config/.environment-bootstrap"

WALLPAPERS_DIR="${HOME}/.config/hypr/wallpapers"
SELECTED_FILE=$(mktemp)

"$TERM" -e yazi --chooser-file="$SELECTED_FILE" "$WALLPAPERS_DIR"

SELECTED_PATH=$(cat "$SELECTED_FILE")
rm -f "$SELECTED_FILE"

[ -z "$SELECTED_PATH" ] && exit 0

# Convert $HOME to ~ for config file consistency
CONFIG_PATH=$(echo "$SELECTED_PATH" | sed "s|^$HOME|~|")

# Update hyprpaper.conf with ~ path
sed -i "s|^[[:space:]]*path[[:space:]]*=.*$|  path =  ${CONFIG_PATH}|" "$HYPRPAPER_FILE"

# Preload and apply with full path
hyprctl hyprpaper preload "$SELECTED_PATH"
hyprctl hyprpaper wallpaper ",$SELECTED_PATH"
hyprctl hyprpaper unload unused

# Remove old lock screen image
rm -f "$HYPRLOCK_PATH"

notify-send "Wallpaper" "Alterado para:\n$(basename "$SELECTED_PATH")"
