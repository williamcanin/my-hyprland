#!/usr/bin/env sh

# shellcheck disable=SC1091
. "$HOME/.config/.environment-bootstrap"

# Run xdg-user
xdg-user-dirs-update

# set_wallpaper() {
#   hyprctl hyprpaper wallpaper ",$WALLPAPER_PATH" &
# }

set_gsettings() {
  # GTK Theme
  if command -v gsettings >/dev/null 2>&1; then
    if
      gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME" &&
      gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME" &&
      gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' &&
      gsettings set org.gnome.desktop.interface cursor-theme "$GTK_CURSOR"
    then
      printf "GTK theme applied."
    else
      printf "Could not apply GTK theme."
    fi
  else
    printf "gsettings not found — GTK theme not changed."
  fi

  # Disabled buttons: minimize,maximize,close.
  if
    gsettings set org.gnome.desktop.wm.preferences button-layout "$BUTTON_LAYOUT"
  then
    printf "Disabled buttons 'minimize,maximize,close' in window"
  fi
}

run_waybars() {
  pkill -x waybar &
  sleep 0.5

  # INFO System
  waybar -c "$(paths_config "waybar/sysinfo.jsonc")" -s "$(paths_config "waybar/sysinfo.css")" &
  sleep 1

  # Status Bar Top
  waybar &
}

case "$1" in
  --started)
    set_gsettings
    pkill hyprpaper; hyprpaper &
    pkill hypridle; hypridle &
    run_waybars
    pkill qs; qs -c sidebar-right &
    # set_wallpaper
    pkill snappy-switcher; snappy-switcher --daemon &
    wl-paste --type text --watch cliphist store &
    wl-paste --type image --watch cliphist store &
    systemctl --user restart --now dunst

    # PolicyKit agent (graphical auth)
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

    # Bluetooth
    systemctl enable --now bluetooth >/dev/null 2>&1 &
    blueman-applet &
  ;;
  --waybars)
    run_waybars
  ;;
  --set-wallpaper)
    # set_wallpaper
  ;;
  --reload)
    hyprctl reload
    pkill hyprpaper; hyprpaper &
    pkill hypridle; hypridle &
    systemctl --user restart xdg-desktop-portal-gtk
    set_wallpaper
    run_waybars
    pkill qs; qs -c sidebar-right &
    pkill snappy-switcher; snappy-switcher --daemon &
    systemctl --user restart --now dunst

    # PolicyKit agent (graphical auth)
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

    # Bluetooth
    systemctl enable --now bluetooth >/dev/null 2>&1 &
    blueman-applet &
  ;;
  *)
    notify-send "Error" "[hyprland:scripts:init]: Invalid parameter"
  ;;
esac
