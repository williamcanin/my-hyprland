#!/usr/bin/env sh

# shellcheck disable=SC1091,SC2086

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

. "$SCRIPT_DIR/libs/version.lib"
. "$SCRIPT_DIR/libs/msg.lib"
. "$SCRIPT_DIR/libs/help.lib"
. "$SCRIPT_DIR/libs/copyright.lib"

select_distro() {
  printf "\n" >&2
  log "Select your distribution:" "\n" >&2
  echo "  [1] Arch Linux" >&2
  echo "  [2] Fedora" >&2
  printf "Reply > " >&2
  read -r choice

  case "$choice" in
    1)
      if ! grep -qi "arch" /etc/os-release 2>/dev/null; then
        die "This system does not appear to be Arch Linux. Aborting."
      fi
      echo "arch"
      ;;
    2)
      if ! grep -qi "fedora" /etc/os-release 2>/dev/null; then
        die "This system does not appear to be Fedora. Aborting."
      fi
      echo "fedora"
      ;;
    *)
      die "Invalid option: $choice"
      ;;
  esac
}

pull() {
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

case "$1" in
--install)
  distro=$(select_distro)
  exec sh "$SCRIPT_DIR/$distro/main.sh" --install
  ;;
--upgrade)
  pull
  distro=$(select_distro)
  exec sh "$SCRIPT_DIR/$distro/main.sh" --install
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
