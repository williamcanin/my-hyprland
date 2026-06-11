#!/usr/bin/env sh

KITTY="/usr/bin/kitty"

case "$XDG_SESSION_DESKTOP" in
  Hyprland)
    DIR="hypr"
    CURRENT_WS=$(hyprctl activeworkspace -j | jq -r '.id')
    ;;
  sway)
    DIR="sway"
    CURRENT_WS=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused).name')
    ;;
  *)
    DIR=""
    CURRENT_WS=""
    ;;
esac

require_session() {
  case "$XDG_SESSION_DESKTOP" in
    Hyprland | sway) return 0 ;;
    *)
      notify-send "[waybar]:taskbar.sh" "Unsupported session: ${XDG_SESSION_DESKTOP:-unknown}"
      exit 1
      ;;
  esac
}

go_workspace() {
  require_session
  case "$XDG_SESSION_DESKTOP" in
    Hyprland) hyprctl dispatch "hl.dsp.focus({ workspace = \"$1\" })" ;;
    sway)     swaymsg workspace "$1" ;;
  esac
}

switch_keyboard_layout() {
  require_session
  case "$XDG_SESSION_DESKTOP" in
    Hyprland)
      # Hyprland: troca layout via hyprctl
      hyprctl switchxkblayout usb-usb-keyboard next
      ;;
    sway)
      swaymsg input type:keyboard xkb_switch_layout next
      ;;
  esac
}

power_menu() {
  [ -n "$DIR" ] || require_session
  # shellcheck disable=SC1091
  # shellcheck disable=SC1090
  . "$HOME/.config/$DIR/scripts/power-menu.sh"
}

term() {
  require_session
  case "$XDG_SESSION_DESKTOP" in
  Hyprland)
    "$KITTY" -e btm -C "$HOME/.config/bottom/$1.toml" && hyprctl dispatch "hl.dsp.focus({ workspace = $CURRENT_WS })"
    ;;
  sway)
    "$KITTY" -e btm -C "$HOME/.config/bottom/$1.toml"
    ;;
  esac
}

case $1 in
  --cal)
    ## Google Calendar
    # google-chrome-stable "https://calendar.google.com/calendar/u/0/r/month"

    ## Gsimplecal
    # sudo pacman -S gsimplecal
    # gsimplecal &

    ## Calcurse
    # sudo pacman -S calcurse kitty
    "$KITTY" --class calcurse-popup -e calcurse
    go_workspace "$CURRENT_WS"
    ;;
  --mem)
    go_workspace 9
    term "mem"
    go_workspace "$CURRENT_WS"
    ;;
  --cpu)
    go_workspace 9
    term "cpu"
    go_workspace "$CURRENT_WS"
    ;;
  --power-menu)
    power_menu
    ;;
  --layout-keyboard)
    switch_keyboard_layout
    ;;
  *)
    notify-send "[waybar]:taskbar.sh" "Invalid parameter: ${1:-empty}"
    exit 1
    ;;
esac
