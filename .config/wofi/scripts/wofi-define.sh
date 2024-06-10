#!/usr/bin/env bash

# Dictionary for use with wofi/dmenu(2)

if [[ -z $(command -v define) ]]; then
	echo >&2 "define not found"
	exit
fi

# Path to wofi/dmenu application
if [[ -n $(command -v wofi) ]]; then
	menu="$(command -v wofi) -dmenu"
	exit
fi

word=$($menu -p "define ")

while [ -n "$word" ]; do
	definition=$(define "$word")
	if [[ -z $definition ]]; then
		$menu -p "define" -l 0 -mesg "$word could not be found"
		word=""
	else
		word=$($menu -p "define" -l 0 -mesg "$definition")
	fi
done
