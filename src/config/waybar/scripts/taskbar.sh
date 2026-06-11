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
esac

go_workspace() {
  case "$XDG_SESSION_DESKTOP" in
    Hyprland) hyprctl dispatch "hl.dsp.focus({ workspace = \"$1\" })" ;;
    sway)     swaymsg workspace "$1" ;;
  esac
}

switch_keyboard_layout() {
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
  # shellcheck disable=SC1091
  # shellcheck disable=SC1090
  . "$HOME/.config/$DIR/scripts/power-menu.sh"
}

term() {
  case "$XDG_SESSION_DESKTOP" in
  Hyprland)
    $KITTY -e btm -C "$HOME/.config/bottom/$1.toml" && hyprctl dispatch "hl.dsp.focus({ workspace = $CURRENT_WS })"
    ;;
  sway)
    $KITTY -e btm -C "$HOME/.config/bottom/$1.toml"
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
    $KITTY --class calcurse-popup -e calcurse
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
esac
