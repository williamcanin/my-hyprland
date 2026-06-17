#!/usr/bin/env sh

# shellcheck disable=SC1091
. "$HOME/.config/my-hyprland/sh/bootstrap.sh"

OS=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')
LOCALE=$(locale | awk -F= '/^LANG=/{print $2}')
UPTIME=$(uptime -p | sed 's/^up //')
KERNEL=$(uname -r)

CPU=$(LC_ALL=C lscpu | awk -F: '
/Model name/ {
    gsub(/^[ \t]+/, "", $2)
    print $2
    exit
}' | sed 's/(R)//g; s/(TM)//g; s/Core//g; s/  */ /g')

GPU=$(lspci | awk -F': ' '
/VGA compatible controller|3D controller/ {
    print $2
    exit
}' | sed 's/.*\[\(.*\)\].*/\1/')

TEXT=$(
cat <<EOF
<span foreground='#3aa99f'>OS:</span>       $OS
<span foreground='#3aa99f'>Kernel:</span>   $KERNEL
<span foreground='#3aa99f'>Locale:</span>   $LOCALE
<span foreground='#3aa99f'>Uptime:</span>   $UPTIME
<span foreground='#3aa99f'>CPU:</span>      $CPU
<span foreground='#3aa99f'>GPU:</span>      $GPU
EOF
)

json_output "$TEXT"