#!/usr/bin/env sh

# shellcheck disable=SC1091
. "$HOME/.config/hypr/scripts/base.sh"

# Run xdg-user
xdg-user-dirs-update

set_wallpaper() {
  hyprctl hyprpaper wallpaper ",$WALLPAPER_PATH" &
}

run_waybars() {
  pkill -x waybar &
  sleep 0.5

  # INFO System
  waybar -c ~/.config/waybar/sysinfo.jsonc -s ~/.config/waybar/sysinfo.css &
  sleep 1

  # Status Bar Top
  waybar &
}

case "$1" in
  --started)
    pkill hyprpaper; hyprpaper &
    pkill hypridle; hypridle &
    run_waybars
    set_wallpaper
    pkill mako; mako &
    pkill snappy-switcher; snappy-switcher --daemon &
    wl-paste --type text --watch cliphist store &
    wl-paste --type image --watch cliphist store &
  ;;
  --waybars)
    run_waybars
  ;;
  --set-wallpaper)
    set_wallpaper
  ;;
  --reload)
    hyprctl reload
    pkill hyprpaper; hyprpaper &
    pkill hypridle; hypridle &
    pkill mako; mako &
    set_wallpaper
    run_waybars
    pkill snappy-switcher; snappy-switcher --daemon &
  ;;
  *)
    notify-send "Error" "[hyprland:scripts:init]: Invalid parameter"
  ;;
esac
