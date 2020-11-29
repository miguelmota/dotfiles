#!/usr/bin/env sh

pkill polybar

t="right"
for m in $(polybar --list-monitors | cut -d":" -f1 | sort -ru); do
  MONITOR=$m TRAY_POS=$t polybar --reload top &

  # note: only one bar may have system tray
  if [[ $t != "" ]]; then
    t=""
  fi
done
