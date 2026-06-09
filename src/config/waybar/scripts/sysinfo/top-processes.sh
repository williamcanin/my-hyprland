#!/usr/bin/env sh

N_PROC="5"
PS="/usr/bin/ps"
AWK="/usr/bin/awk"

OUTPUT=$(
  {
    printf "%-7s %-5s %-5s %s\n" "PID" "CPU%" "MEM%" "CMD"

    $PS -eo pid,pcpu,pmem,comm --no-headers |
      sort -k2 -rn |
      head -n "$N_PROC" |
      $AWK '
        {
            printf "%-7s %-5.1f %-5.1f %s\n",
                   $1, $2, $3, $4
        }'
  }
)

printf '{"text":"%s"}\n' \
  "$(printf '%s' "$OUTPUT" | sed ':a;N;$!ba;s/\n/\\n/g')"
