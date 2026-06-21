# shellcheck shell=sh

settings_cosmic() {
  log "Cosmic Files settings..." "\n"
  mkdir -p "$HOME/.config/cosmic/com.system76.CosmicTk/v1/"
  echo "false" > "$HOME/.config/cosmic/com.system76.CosmicTk/v1/show_maximize"
  echo "false" > "$HOME/.config/cosmic/com.system76.CosmicTk/v1/show_minimize"
  echo "\"$ICON_THEME\"" > "$HOME/.config/cosmic/com.system76.CosmicTk/v1/icon_theme"
  if command -v cosmic-settings >/dev/null 2>&1; then
    cosmic-settings appearance import "$REPO_ROOT/src/imports/cosmic/dark-theme.ron"
  fi
  ok "Settings Cosmic done!"
}
