#!/usr/bin/env bash

green="%{F#55aa55}"
yellow="%{F#f5a70a}"
red="%{F#ff5555}"
white="%{F#fff}"
gray="%{F#555}"

status_icon() {
  # result=$(pactl list | sed -n '/^Source/,/^$/p' | grep Mute | grep yes > /dev/null)
  result=$(amixer get Capture | grep -o "Front Left:.*\[\(on\)\]$")

  if [ $? -eq 0 ]; then
    icon="●"
    echo "MIC: $red$icon"
  else
    icon="●"
    echo "MIC: $gray$icon"
  fi
}

status_icon

while read line; do
  if [ "$line" == "Event 'change' on source #1" ]; then
    status_icon
  fi
done < <(pactl subscribe)