#!/bin/bash

# running cron job:
# $sudo crontab -e
# contents:
# SHELL=/bin/bash
# */5 * * * * su mota -c "/home/mota/.bin/low_battery_notification.sh"


# use `upower -d` to view info for batteries
battery_number="$1"

battery_path_0="/org/freedesktop/UPower/devices/battery_BAT0"
battery_path_1="/org/freedesktop/UPower/devices/battery_BAT1"
state_0=$(upower -i $battery_path_0 | grep state | awk '{print $2}')
state_1=$(upower -i $battery_path_1 | grep state | awk '{print $2}')
level_0=$(upower -i $battery_path_0 | grep percentage | awk '{print $2}' | sed 's/%//')
level_1=$(upower -i $battery_path_1 | grep percentage | awk '{print $2}' | sed 's/%//')

max=$(("$level_0 + $level_1"))
level=$(("$max / 2"))
state="$state_0"

if [ "$state_0" == "charging" ] || [ "$state_1" == "charging" ]; then
  state="charging"
fi

if [ "$state_0" == "discharging" ] || [ "$state_1" == "discharging" ]; then
  state="discharging"
fi

notify() {
  DISPLAY=:0.0 DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/notify-send "$@"
}

if [ "$state" == "discharging" ]; then
  if (( level <= 8 )); then
    notify -u critical -t 60000 'Critical Low Battery. Suspending...' "$level% of battery remaining"
    sleep 1
    sudo systemctl hibernate
    exit 0
  fi

  if (( level <= 10 )); then
    notify -u critical -t 60000 'Critical Low Battery' "$level% of battery remaining"
    play -nq -t alsa synth 0.2 sine 250
    exit 0
  fi

  if (( level <= 20 )); then
    notify -u normal -t 5000 'Low Battery' "$level% of battery remaining"
    exit 0
  fi
fi

if [ "$state" == "charging" ]; then
  if (( level >= 99 )); then
    #notify -u normal -t 5000 'Battery Charged' "$level% battery charged"
    exit 0
  fi
fi

if [ "$state" == "fully-charged" ]; then
  if (( level >= 99 )); then
    #notify -u normal -t 5000 'Battery Fully Charged' "$level% battery charged"
    exit 0
  fi
fi
