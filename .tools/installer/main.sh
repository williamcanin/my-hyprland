#!/usr/bin/env sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/libs/version.lib"
# shellcheck disable=SC1091
. "$SCRIPT_DIR/libs/msg.lib"
# shellcheck disable=SC1091
. "$SCRIPT_DIR/libs/help.lib"
# shellcheck disable=SC1091
. "$SCRIPT_DIR/libs/symlink.lib"
# shellcheck disable=SC1091
. "$SCRIPT_DIR/libs/term.lib"
# shellcheck disable=SC1091
. "$SCRIPT_DIR/libs/copyright.lib"

CONFIG_SRC="$REPO_ROOT/src/config"
CONFIG_DST="$HOME/.config"
FONTS_SRC="$REPO_ROOT/src/fonts"
FONTS_DST="$HOME/.local/share/fonts"
BASE_DEPS="git base-devel go gcc"
PACKAGES="
  firefox hyprland hyprpaper hypridle hyprshutdown hyprlock hyprshot hyprlua-git
  lua rofi-wayland kitty wev playerctl brightnessctl moreutils wtype fastfetch
  flameshot grim cliphist wl-clipboard slurp swappy foot
  xdg-desktop-portal xdg-desktop-portal-wlr smog-bin xarchiver file-roller zip
  unzip zathura terminus-font nautilus terminus-font-ttf mpv magick pwvucontrol
  mako jq rofimoji rofi-calc bottom btop satty gsimplecal calcurse hyprpicker
  kooha xdg-utils gtk3 gtk4 adwaita-icon-theme noto-fonts noto-fonts-emoji uwsm
  ttf-nerd-fonts-symbols-mono ttf-jetbrains-mono-nerd otf-font-awesome vivid
  libnotify pamixer wireplumber networkmanager zsh papirus-icon-theme wf-recorder
  gpu-screen-recorder snappy-switcher
"

install_yay () {
  log "yay not found — installing dependencies..." "\n"
  # shellcheck disable=SC2086
  sudo pacman -S --needed --noconfirm $BASE_DEPS || die "Failed to install yay dependencies."

  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT INT TERM

  log "Cloning yay..." "\n"
  git clone https://aur.archlinux.org/yay.git "$tmp/yay" || die "Failed to clone yay."

  log "Compiling and installing yay..." "\n"
  (cd "$tmp/yay" && makepkg -si --noconfirm) || die "Failed to compile yay."

  ok "Yay, installed!"
}

ensure_yay () {
  if command -v yay >/dev/null 2>&1; then
    ok "Yay, it's already installed."
  else
    install_yay
  fi
}

default_apps() {
  # Browser
  if command -v xdg-settings >/dev/null 2>&1; then
    if xdg-settings set default-web-browser firefox.desktop; then
      ok "Default browser applied to: Firefox."
    else
      warn "Could not set Firefox as default browser."
    fi
  else
    warn "xdg-settings not found — default browser not changed."
  fi
}

set_theme() {
  # GTK Theme
  if command -v gsettings >/dev/null 2>&1; then
    if
      gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark &&
        gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' &&
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    then
      ok "GTK theme applied."
    else
      warn "Could not apply GTK theme."
    fi
  else
    warn "gsettings not found — GTK theme not changed."
  fi
}

install_packages () {
  log "Installing necessary packages..." "\n"
  # shellcheck disable=SC2086
  yay -S --needed --noconfirm $PACKAGES || die "Failed to install required packages."
  ok "All packages installed."

  default_apps
  set_theme
}

copy_configs() {
  [ -d "$CONFIG_SRC" ] || die "Directory of configurations not found: $CONFIG_SRC."

  log "Copying configs → $CONFIG_DST" "\n"
  mkdir -p "$CONFIG_DST"

  # Permissions .sh
  find "$CONFIG_SRC" -type f -name "*.sh" -exec chmod +x {} \;

  for src_dir in "$CONFIG_SRC"/*/; do
    [ -d "$src_dir" ] || continue

    name="${src_dir%/}"
    name="${name##*/}"
    dst_dir="$CONFIG_DST/$name"

    if [ -d "$dst_dir" ]; then
      backup="${dst_dir}.bak.$(date +%Y%m%d%H%M%S)"
      mv "$dst_dir" "$backup"
      warn "$name — backup saved in $backup"
    fi

    cp -rv "$src_dir" "$CONFIG_DST/"
    ok "$name"
  done

  # Remove backups older than 30 days
  find "$CONFIG_DST" -maxdepth 1 -name "*.bak.*" -mtime +30 | while IFS= read -r old; do
    rm -rfv "$old"
    warn "Old backup removed: $old"
  done
}

symlinks() {
  log "Creating symbolic links..." "\n"
  mkdir -p "$HOME/.local/bin"

  # Kitty Help shortcuts
  symlink "$HOME/.config/kitty/scripts/shortcuts.sh" "$HOME/.local/bin/kitty-help"

  ok "Creation of symbolic links completed."
  warn "Adding \"\$HOME/.local/bin\" in PATH"
}

copy_fonts() {
  [ -d "$FONTS_SRC" ] || {
    warn "Fonts directory not found: $FONTS_SRC — jumping."
    return
  }

  log "Copying fonts → $FONTS_DST" "\n"
  mkdir -p "$FONTS_DST"

  count=0
  for font in "$FONTS_SRC"/*; do
    [ -e "$font" ] || continue
    cp -rfv "$font" "$FONTS_DST/"
    count=$((count + 1))
  done

  if [ "$count" -eq 0 ]; then
    warn "No source found in $FONTS_SRC."
  else
    ok "$count file(s)/folder(s) copied."

    if command -v fc-cache >/dev/null 2>&1; then
      log "Updating font cache..." "\n"
      fc-cache -f "$FONTS_DST"
      ok "Cache fonts updated."
    else
      warn "fc-cache not found — refresh the cache manually afterwards."
    fi
  fi
}

pull () {
  if ! command -v git >/dev/null 2>&1; then
    die "Git is not installed. Please install it."
  fi

  log "Checking for updates..." "\n"

  git fetch origin || die "Failed to contact the remote repository."

  head=$(git rev-parse HEAD)
  fetch_head=$(git rev-parse FETCH_HEAD)

  if [ "$head" = "$fetch_head" ]; then
    ok "Already been updated."
    return 0
  fi

  git merge --ff-only FETCH_HEAD || die "Failed to apply updates."

  ok "Updated to version: $VERSION."
}

install() {
  ensure_yay
  install_packages
  copy_configs
  symlinks
  copy_fonts
  install_term_options
}

case "$1" in
--install)
  install
  copyright
  ;;
--upgrade)
  pull
  install
  copyright
  ;;
--help)
  help
  copyright
  ;;
--help-dev)
  help_dev
  copyright
  ;;
--version)
  plain "Version: $VERSION" "\n"
  ;;
*)
  help
  copyright
  exit 1
  ;;
esac
exit 0
