#!/usr/bin/env bash

yellow="%{F#ffff00}"
red="%{F#bd2c40}"
white="%{F#fff}"
gray="%{F#555}"

status_icon() {
  prefix="MIC: "
  # result=$(pactl list | sed -n '/^Source/,/^$/p' | grep Mute | grep yes > /dev/null)
  result=$(amixer get Capture | grep -o "Front Left:.*\[\(on\)\]$")
  if [ $? -eq 0 ]; then
    icon="●"
    echo "$red$prefix$icon"
  else
    icon="×"
    echo "$white$prefix$icon"
  fi
}

status_icon

while read line; do
  if [ "$line" == "Event 'change' on source #1" ] || [ "$line" == "Event 'change' on source #2" ] || [ "$line" == "Event 'change' on source #4" ]; then
    status_icon
  fi
done < <(pactl subscribe)