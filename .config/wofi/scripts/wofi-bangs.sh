#!/usr/bin/env bash
#
#  info: this is a script to launch other rofi scripts,
#       saves us the trouble of binding multiple hotkeys for each script,
#       when we can just use one hotkey for everything.

# Edited from gotbletu's (https://www.youtube.com/user/gotbletu) version for rofi
# got-blue's demo: https://www.youtube.com/watch?v=kxJClZIXSnM

declare -A COMMANDS

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
WOFI_SCRIPTS_DIR=${XDG_CONFIG_HOME}/wofi/scripts

###
# List of defined 'bangs'

# clipboard history
COMMANDS["clipboard"]="$WOFI_SCRIPTS_DIR/wofi-gpaste"

# TODO: Get this working on GNOME wayland
COMMANDS["windows"]='wofi -show window'

# launch programs
COMMANDS["apps"]="wofi -combi-modi drun,run -show combi"

# Use calculator (insect)
COMMANDS["calc"]="$WOFI_SCRIPTS_DIR/wofi-insect/wofi-insect.sh"

# search local files
COMMANDS["locate"]="$WOFI_SCRIPTS_DIR/wofi-locate.sh"

##
# Generate menu
##
function print_menu() {
	for key in "${!COMMANDS[@]}"; do
		echo "$key"
	done
}

##
# Show wofi.
##
function start() {
	# print_menu | wofi -dmenu -p "?=>"
	print_menu | sort | wofi --show dmenu -mesg ">>> Your collection of wofi integrations" -i -p "wofi-bangs"

}

# Run it
value="$(start)"

# Split input.
# grab upto first space.
choice=${value%%\ *}
# graph remainder, minus space.

##
# Cancelled? bail out
##
if test -z "${choice}"; then
	exit
fi

# check if choice exists
if test ${COMMANDS[$choice]+isset}; then
	# Execute the choice
	eval echo "Executing: ${COMMANDS[$choice]}"
	eval "${COMMANDS[$choice]}"
else
	eval "$choice" | wofi
	# prefer my above so I can use this same script to also launch apps like geany or leafpad etc (DK)
	#   echo "Unknown command: ${choice}" | wofi -dmenu -p "error"
fi
