#!/usr/bin/env sh
# shellcheck shell=sh disable=SC1091

# =============================================================================
# bootstrap.sh — Carrega automaticamente todos os módulos compartilhados.
#
# Uso em scripts:
#   . "${HOME}/.config/my-hyprland/sh/bootstrap.sh"
#
# Isso disponibiliza todas as APIs (log_*, string_*, json_*, ...)
# e variáveis globais (WALLPAPER_PATH, BUTTON_LAYOUT, ...).
# =============================================================================

MODULES_DIR="${HOME}/.config/my-hyprland/sh"

. "${MODULES_DIR}/variables.sh"
. "${MODULES_DIR}/paths.sh"
. "${MODULES_DIR}/locale.sh"
. "${MODULES_DIR}/log.sh"
. "${MODULES_DIR}/notify.sh"
. "${MODULES_DIR}/string.sh"
. "${MODULES_DIR}/json.sh"
. "${MODULES_DIR}/hypr.sh"
