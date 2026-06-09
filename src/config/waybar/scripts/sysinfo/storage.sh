#!/usr/bin/env sh

BAR_SIZE="8"

make_bar() {
  percent=$1
  size=$2

  filled=$((percent * size / 100))
  empty=$((size - filled))

  i=0
  while [ "$i" -lt "$filled" ]; do
    printf "█"
    i=$((i + 1))
  done

  i=0
  while [ "$i" -lt "$empty" ]; do
    printf "░"
    i=$((i + 1))
  done
}

get_mount_info() {
  mount="$1"

  df -BG "$mount" 2>/dev/null | awk 'NR==2 {
        gsub(/G/, "", $2)
        gsub(/G/, "", $3)
        gsub(/%/, "", $5)

        printf "%s %s %s\n", $3, $2, $5
    }'
}

ROOT_INFO=$(get_mount_info "/")
HOME_INFO=$(get_mount_info "/home")

ROOT_USED=$(printf '%s\n' "$ROOT_INFO" | awk '{print $1}')
ROOT_TOTAL=$(printf '%s\n' "$ROOT_INFO" | awk '{print $2}')
ROOT_PERC=$(printf '%s\n' "$ROOT_INFO" | awk '{print $3}')

HOME_USED=$(printf '%s\n' "$HOME_INFO" | awk '{print $1}')
HOME_TOTAL=$(printf '%s\n' "$HOME_INFO" | awk '{print $2}')
HOME_PERC=$(printf '%s\n' "$HOME_INFO" | awk '{print $3}')

ROOT_BAR=$(make_bar "$ROOT_PERC" "$BAR_SIZE")
HOME_BAR=$(make_bar "$HOME_PERC" "$BAR_SIZE")

TEXT=$(
  cat <<EOF
Mount   Used         Perc
/       ${ROOT_USED}/${ROOT_TOTAL}G   ${ROOT_PERC}% $ROOT_BAR
/home   ${HOME_USED}/${HOME_TOTAL}G   ${HOME_PERC}% $HOME_BAR
EOF
)

printf '{"text":"%s"}\n' \
  "$(printf '%s' "$TEXT" | sed ':a;N;$!ba;s/\n/\\n/g')"
