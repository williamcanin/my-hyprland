#!/usr/bin/env sh

ROFI="/usr/bin/rofi"

case "${LC_MESSAGES:-${LANG:-en}}" in
pt*)
  cat "$HOME/.config/hypr/docs/shortcuts/pt.txt" | $ROFI -dmenu -p "Procurar" -i -theme-str 'window { height: 600px;}'
  ;;
*)
  cat "$HOME/.config/hypr/docs/shortcuts/en.txt" | $ROFI -dmenu -p "Search" -i -theme-str 'window { height: 600px;}'
  ;;
esac
