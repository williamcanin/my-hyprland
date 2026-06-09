#!/usr/bin/env sh

GPU_SCRIPT="$HOME/.config/waybar/scripts/sysinfo/gpu.sh"

BAR_SIZE="8"

cpu_temp() {
  # Prioritizes known CPU sensors
  for h in /sys/class/hwmon/hwmon*; do
    [ -r "$h/name" ] || continue

    case "$(cat "$h/name")" in
    coretemp | k10temp | zenpower)
      for label in "$h"/temp*_label; do
        [ -r "$label" ] || continue

        case "$(cat "$label")" in
        "Package id 0" | Tctl | Tdie | Package)
          input="${label%_label}_input"
          awk '{printf "%.0f", $1/1000}' "$input"
          return
          ;;
        esac
      done

      awk '{printf "%.0f", $1/1000}' "$h/temp1_input" 2>/dev/null
      return
      ;;
    esac
  done

  # Fallback
  for t in /sys/class/hwmon/hwmon*/temp*_input; do
    [ -r "$t" ] || continue
    awk '{printf "%.0f", $1/1000}' "$t"
    return
  done

  echo "N/A"
}

cpu_usage() {
  awk '
    BEGIN {
        while ((getline < "/proc/stat") > 0) {
            if ($1 == "cpu") {
                idle1=$5
                total1=0
                for(i=2;i<=NF;i++) total1+=$i
                break
            }
        }
        close("/proc/stat")

        system("sleep 0.2")

        while ((getline < "/proc/stat") > 0) {
            if ($1 == "cpu") {
                idle2=$5
                total2=0
                for(i=2;i<=NF;i++) total2+=$i
                break
            }
        }

        usage=int((1-((idle2-idle1)/(total2-total1)))*100)
        print usage
    }'
}

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

CPU_TEMP="$(cpu_temp)°C"
CPU_USAGE="$(cpu_usage)%"

GPU_TEMP="$("$GPU_SCRIPT" --temp)"
GPU_USAGE="$("$GPU_SCRIPT" --usage)"

CPU_BAR=$(make_bar "${CPU_USAGE%\%}" "$BAR_SIZE")

TEXT=$(
  cat <<EOF
Device      Temp   Use
CPU         $CPU_TEMP   $CPU_USAGE  $CPU_BAR
GPU         $GPU_TEMP   $GPU_USAGE
EOF
)

printf '{"text":"%s"}\n' \
  "$(printf '%s' "$TEXT" | sed ':a;N;$!ba;s/\n/\\n/g')"
