#!/bin/bash

function cell() {
  hex=$(printf '%x' "$1" | awk '{print toupper($0)}')
  col=$(printf '%-2s 0x%-2s ' "$1" "$hex")
  printf "%s" "$col"
}

strt="0"
rows="10"
colwidth="10"
windowwidth="$(tput cols)"
cols="$(($windowwidth / $colwidth))"
maxrows="100"
maxcols="10"
rowadditions=( 100 90 40 23 15 10 7 4 3 1 )

if [ "$1" ]; then
  if echo $1 | grep -qo "+"; then
    strt="${1:1}"
  else
    for arg in "$@"
    do
      cell "$arg"
      printf "\\n"
    done
    exit 0
  fi
fi
if (( $cols > $maxcols )); then
    cols=$maxcols
fi
for i in $(seq 0 9); do
  if (( $cols == $i )); then
    rows="$(($rows + ${rowadditions[$i]}))"
  fi
done
if (( $rows > $maxrows )); then
    rows=$maxrows
fi

for i in $(seq $strt $((($rows-1)+$strt))); do
  for j in $(seq 0 $(($cols-1))); do
    printf "%s" "$(cell $((($rows * $j) + $i)))"
  done
  printf "\\n"
done