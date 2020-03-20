#!/bin/bash

# use `upower -d` to view info for batteries
state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep state | awk '{print $2}')
level=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | awk '{print $2}' | sed 's/%//')

notify() {
  DISPLAY=:0.0 DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/notify-send "$@"
}

if [ "$state" == "discharging" ]; then
  if (( level <= 2 )); then
    notify -u critical 'Critical Low Battery. Suspending soon.' "$level% of battery remaining"
    exit 0
  fi

  if (( level <= 5 )); then
    notify -u critical 'Critical Low Battery' "$level% of battery remaining"
    exit 0
  fi

  if (( level <= 20 )); then
    notify -u normal 'Low Battery' "$level% of battery remaining"
    exit 0
  fi
fi

if [ "$state" == "charging" ]; then
  if (( level >= 99 )); then
    notify -u normal 'Battery Charged' "$level% battery charged"
    exit 0
  fi

  notify -u low 'Charging Battery' "$level% battery charged"
  exit 0
fi
