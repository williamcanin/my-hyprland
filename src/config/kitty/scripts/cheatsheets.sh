#!/usr/bin/env sh

FINDER="/usr/bin/rofi"

case "${LC_MESSAGES:-${LANG:-en}}" in
pt*)
  if [ $FINDER = "/usr/bin/rofi" ]; then
    cat "$HOME/.config/kitty/docs/shortcuts/pt.txt" | $FINDER -dmenu -p "Procurar" -i -theme-str 'window { height: 600px;}'
  elif [ $FINDER = "/usr/bin/wofi" ]; then
    cat "$HOME/.config/kitty/docs/shortcuts/pt.txt" | $FINDER
  fi
  ;;
*)
  if [ $FINDER = "/usr/bin/rofi" ]; then
    cat "$HOME/.config/kitty/docs/shortcuts/en.txt" | $FINDER -dmenu -p "Search" -i -theme-str 'window { height: 600px;}'
  elif [ $FINDER = "/usr/bin/wofi" ]; then
    cat "$HOME/.config/kitty/docs/shortcuts/en.txt" | $FINDER
  fi
  ;;
esac
