#!/bin/bash

# Usage:
# $ ./ibrew.sh {search-term}
# Examples:
# $ ./ibrew.sh "say"

query="$1"

nc='\033[0m'
red='\033[31m'
yellow='\033[33m'
white='\033[37m'
bold=$(tput bold)
normal=$(tput sgr0)

printf "Searching for ${yellow}\"%s\"${nc}...\\n" "$query"

output=$(brew search "$query" 2>&1)
if [[ ! "$(echo "$output" || grep -i 'no formula')" ]]; then
  printf "Nothing found for \"${yellow}%s${nc}\"" "$query"
  exit 1
fi

output=$(echo "$output" | strings | grep -v '==')
IFS=$'\n' read -rd '' -a options <<< "$output"

prompt="Select option #: "

printf "Select formula to install:\\n"
for i in "${!options[@]}"; do
    printf "${bold}${white}%3d${nc}${normal}%s ${yellow}%s${nc}\\n" $((i+1)) "${choices[i]:- }" "${options[i]}"
done

read -rp "$prompt" num

(( num > 0 && num <= ${#options[@]} )) || {
  printf "${red}ERROR:${nc} ${yellow}Invalid option \"%s\"${nc}\\n" "$num"
  exit 1
}

idx="$((num-1))"
option="${options[$idx]}"

printf "Installing formula ${yellow}%s${nc}...\\n" "$option"

brew install "$option"