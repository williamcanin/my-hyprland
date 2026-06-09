#!/usr/bin/env sh

ROFI="/usr/bin/rofi"

case "${LC_MESSAGES:-${LANG:-en}}" in
pt*)
  # $ROFI -e "$(cat $HOME/.config/hypr/docs/shortcuts/pt.txt)"
  cat "$HOME/.config/hypr/docs/shortcuts/pt.txt" | $ROFI -dmenu -p "Procurar" -i
  ;;
*)
  # $ROFI -e "$(cat $HOME/.config/hypr/docs/shortcuts/en.txt)"
  cat "$HOME/.config/hypr/docs/shortcuts/en.txt" | $ROFI -dmenu -p "Search" -i
  ;;
esac
