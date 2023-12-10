#!/usr/bin/env bash

# Dictionary for use with rofi/dmenu(2)

if [[ -z $(command -v define) ]];  then
  echo >&2 "define not found"
  exit
fi

# Path to rofi/dmenu application
if [[ -n $(command -v rofi) ]]; then
    menu="$(command -v rofi) -dmenu"
elif [[ -n $(command -v dmenu) ]]; then
    menu="$(command -v dmenu)"
else
    echo >&2 "Rofi or dmenu not found"
    exit
fi

word=$($menu -p "define ")

while [ -n "$word" ]; do
  definition=$(define $word)
  if [[ -z $definition ]]; then
    $menu -p "define" -l 0 -mesg "$word could not be found"
    word=""
  else
    word=$($menu -p "define" -l 0 -mesg "$definition")
  fi
done
