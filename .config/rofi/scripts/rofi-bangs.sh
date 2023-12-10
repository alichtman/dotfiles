#!/usr/bin/env bash
# author: unknown
# sentby: MoreChannelNoise (https://www.youtube.com/user/MoreChannelNoise)
# editby: gotbletu (https://www.youtube.com/user/gotbletu)

# demo: https://www.youtube.com/watch?v=kxJClZIXSnM
# info: this is a script to launch other rofi scripts,
#       saves us the trouble of binding multiple hotkeys for each script,
#       when we can just use one hotkey for everything.

declare -A COMMANDS

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

###
# List of defined 'bangs'

# greenclip clipboard history
# source: https://github.com/erebe/greenclip
COMMANDS["clipboard"]="rofi -modi 'clipboard:$HOME/bin/greenclip print' -show clipboard"

COMMANDS["windows"]='rofi -show window'

# launch programs
# COMMANDS["apps"]="rofi -combi-modi drun,run -show combi"

# open bookmarks
# COMMANDS["bookmarks"]="~/.scripts/rofi-scripts-collection/rofi-surfraw-bookmarks.sh"

# Use calculator (insect)
COMMANDS["calc"]="$XDG_CONFIG_HOME/rofi/scripts/rofi-insect/rofi-insect.sh"

# search local files
COMMANDS["locate"]="$XDG_CONFIG_HOME/rofi/scripts/rofi-locate.sh"

# open custom web searches
# COMMANDS["websearch"]="$XDG_CONFIG_HOME/rofi/scripts/rofi-surfraw-websearch.sh"

# show clipboard history
# source: https://bitbucket.org/pandozer/rofi-clipboard-manager/overview
# COMMANDS["clipboard"]='rofi -modi "clipboard:~/.bin/rofi-clipboard-manager/mclip.py menu" -show clipboard && ~/.bin/rofi-clipboard-manager/mclip.py paste'

# references --------------------------
# COMMANDS[";sr2"]="chromium 'wikipedia.org/search-redirect.php?search=\" \${input}\""

# COMMANDS[";piratebay"]="chromium --disk-cache-dir=/tmp/cache http://thepiratebay.org/search/\" \${input}\""

# COMMANDS["ranger"]="ranger '/home/alichtman'"

# COMMANDS["#screenshot"]='/home/alichtman/bin/screenshot-scripts/myscreenshot.sh'

##
# Generate menu
##
function print_menu()
{
    for key in "${!COMMANDS[@]}"
    do
      echo "$key"
    done
}

##
# Show rofi.
##
function start()
{
    # print_menu | rofi -dmenu -p "?=>"
    print_menu | sort | rofi -dmenu -mesg ">>> Your collection of rofi integrations" -i -p "rofi-bangs"

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
if test -z "${choice}"
then
    exit
fi

# check if choice exists
if test ${COMMANDS[$choice]+isset}
then
    # Execute the choice
    eval echo "Executing: ${COMMANDS[$choice]}"
    eval "${COMMANDS[$choice]}"
else
    eval  "$choice" | rofi
 # prefer my above so I can use this same script to also launch apps like geany or leafpad etc (DK)
 #   echo "Unknown command: ${choice}" | rofi -dmenu -p "error"
fi
