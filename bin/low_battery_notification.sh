#!/bin/bash

# use `upower -d` to view info for batteries
battery_number=1
battery_path="/org/freedesktop/UPower/devices/battery_BAT$battery_number"
state=$(upower -i $battery_path | grep state | awk '{print $2}')
level=$(upower -i $battery_path | grep percentage | awk '{print $2}' | sed 's/%//')

notify() {
  DISPLAY=:0.0 DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/notify-send "$@"
}

if [ "$state" == "discharging" ]; then
  if (( level <= 2 )); then
    notify -u critical -t 60000 'Critical Low Battery. Suspending soon.' "$level% of battery remaining"
    exit 0
  fi

  if (( level <= 5 )); then
    notify -u critical -t 60000 'Critical Low Battery' "$level% of battery remaining"
    exit 0
  fi

  if (( level <= 20 )); then
    notify -u normal -t 5000 'Low Battery' "$level% of battery remaining"
    exit 0
  fi
fi

if [ "$state" == "fully-charged" ]; then
  notify -u normal -t 5000 'Battery Fully Charged' "$level% battery charged"
  exit 0
fi

if [ "$state" == "charging" ]; then
  if (( level >= 99 )); then
    notify -u normal -t 5000 'Battery Charged' "$level% battery charged"
    exit 0
  fi

  notify -u low -t 2000 'Charging Battery' "$level% battery charged"
  exit 0
fi
