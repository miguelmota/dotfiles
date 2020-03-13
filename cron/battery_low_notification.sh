#!/bin/bash

# battery percentage script: https://github.com/miguelmota/dotfiles/blob/master/bin/battery
percentage=$($HOME/.bin/battery)
value=$(echo $percentage | sed 's/%//')

notify() {
  DISPLAY=:0.0 DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/notify-send "$@"
}

if (( value <= 5 )); then
  notify -u critical 'Critical Low Battery' "$percentage of battery remaining"
  exit 0
fi

if (( value <= 20 )); then
  notify -u normal 'Low Battery' "$percentage of battery remaining"
  exit 0
fi