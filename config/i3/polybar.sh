#!/usr/bin/env sh

pkill polybar

tray_pos=right
i=0

# get list of monitors
monitors=$(polybar --list-monitors | cut -d":" -f1 | sort -ru)

for monitor in $monitors; do
  i=$(($i+1))

  bottom=false
  # move polybar to bottom on second monitor or if explicity specified
  if [[ "$1" == "bottom" ]] || [[ $monitor == "HDMI-2" ]]; then
    bottom=true
  fi

  MONITOR=$monitor TRAY_POS=$tray_pos BOTTOM=$bottom polybar --reload top &

  # note: only one bar may have system tray
  if [ $i -gt 0 ]; then
    tray_pos=""
  fi
done
