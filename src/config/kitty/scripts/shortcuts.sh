#!/usr/bin/env sh

ROFI="/usr/bin/rofi"

case "${LC_MESSAGES:-${LANG:-en}}" in
  pt*)
    # $ROFI -e "$(cat $HOME/.config/kitty/docs/shortcuts/pt.txt)"
    cat "$HOME/.config/kitty/docs/shortcuts/pt.txt" | $ROFI -dmenu -i
  ;;
  *)
    # $ROFI -e "$(cat $HOME/.config/kitty/docs/shortcuts/en.txt)"
    cat "$HOME/.config/kitty/docs/shortcuts/en.txt" | $ROFI -dmenu -i
  ;;
esac
