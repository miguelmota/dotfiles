#!/bin/sh

battery_print() {
    PATH_AC="/sys/class/power_supply/AC"
    PATH_BATTERY_0="/sys/class/power_supply/BAT0"
    PATH_BATTERY_1="/sys/class/power_supply/BAT1"

    ac=0
    battery_level_0=0
    battery_level_1=0
    battery_max_0=0
    battery_max_1=0
    battery_status_0=""
    battery_status_1=""

    if [ -f "$PATH_AC/online" ]; then
        ac=$(cat "$PATH_AC/online")
    fi

    if [ -f "$PATH_BATTERY_0/energy_now" ]; then
        battery_level_0=$(cat "$PATH_BATTERY_0/energy_now")
    fi

    if [ -f "$PATH_BATTERY_0/energy_full" ]; then
        battery_max_0=$(cat "$PATH_BATTERY_0/energy_full")
    fi

    if [ -f "$PATH_BATTERY_0/status" ]; then
        battery_status_0=$(cat "$PATH_BATTERY_0/status")
    fi

    if [ -f "$PATH_BATTERY_1/energy_now" ]; then
        battery_level_1=$(cat "$PATH_BATTERY_1/energy_now")
    fi

    if [ -f "$PATH_BATTERY_1/energy_full" ]; then
        battery_max_1=$(cat "$PATH_BATTERY_1/energy_full")
    fi

    if [ -f "$PATH_BATTERY_1/status" ]; then
        battery_status_1=$(cat "$PATH_BATTERY_1/status")
    fi

    battery_level=$(("$battery_level_0 + $battery_level_1"))
    battery_max=$(("$battery_max_0 + $battery_max_1"))

    battery_percent=$(("$battery_level * 100"))
    battery_percent=$(("$battery_percent / $battery_max"))

    status=""

    if [ "$battery_status_0" == "Charging" ] || [ "$battery_status_1" == "Charging" ]; then
      status="(CHR)"
    fi

    if [ "$ac" -eq 1 ]; then
        label="BAT $status:"

        if [ "$battery_percent" -gt 97 ]; then
            echo "$label"
        else
            echo "$label $battery_percent%"
        fi
    else
        if [ "$battery_percent" -gt 85 ]; then
            label="BAT:"
        elif [ "$battery_percent" -gt 60 ]; then
            label="BAT:"
        elif [ "$battery_percent" -gt 35 ]; then
            label="BAT:"
        elif [ "$battery_percent" -gt 10 ]; then
            label="BAT:"
        else
          label="BAT $status:"
        fi

        echo "$label $battery_percent%"
    fi
}

path_pid="/tmp/polybar-battery-combined-udev.pid"

case "$1" in
    --update)
        pid=$(cat $path_pid)

        if [ "$pid" != "" ]; then
            kill -10 "$pid"
        fi
        ;;
    *)
        echo $$ > $path_pid

        trap exit INT
        trap "echo" USR1

        while true; do
            battery_print

            sleep 30 &
            wait
        done
        ;;
esac
