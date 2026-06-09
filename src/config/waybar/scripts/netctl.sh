#!/usr/bin/env sh

# To use this script, you must create the following file:
#
# sudo cat << EOF > /etc/sudoers.d/network-commands
# $USER ALL=(root) NOPASSWD: /sbin/ip, /bin/ip
# EOF

tr() {
  case "${LC_MESSAGES:-${LANG:-en}}" in
    pt*)
      case "$1" in
        no_iface)      echo "Nenhuma interface encontrada" ;;
        network)       echo "Rede" ;;
        disconnected)  echo "Desconectado" ;;
        reconnecting)  echo "Reconectando" ;;
        state)         echo "Estado" ;;
      esac
      ;;
    *)
      case "$1" in
        no_iface)      echo "No interface found" ;;
        network)       echo "Network" ;;
        disconnected)  echo "Disconnected" ;;
        reconnecting)  echo "Reconnecting" ;;
        state)         echo "State" ;;
      esac
      ;;
  esac
}

IFACE=$(ip route show default 2>/dev/null | awk 'NR==1{print $5}')

if [ -z "$IFACE" ]; then
  IFACE=$(ip link show 2>/dev/null |
    awk -F': ' '/^[0-9]+: e/{print $2; exit}')
fi

[ -z "$IFACE" ] &&
  notify-send "[waybar]:netctl.sh" "$(tr no_iface)" &&
  exit 1

STATE=$(ip link show "$IFACE" 2>/dev/null | awk 'NR==1{print $9}')

case "$STATE" in
UP)
  sudo -n ip link set "$IFACE" down &&
    notify-send "$(tr network)" "$(tr disconnected) ($IFACE)"
  ;;
DOWN | UNKNOWN | "")
  sudo -n ip link set "$IFACE" up &&
    notify-send "$(tr network)" "$(tr reconnecting) $IFACE..."
  ;;
*)
  notify-send "[waybar]:netctl.sh" "$(tr state): $STATE ($IFACE)"
  ;;
esac