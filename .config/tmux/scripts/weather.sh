#!/bin/bash
# Uses wttr.in to get weather in current location.

WEGO=$(which wego)
current_data=$("$WEGO" -l Seattle -u imperial -f json | jq '.Current')
current_temp_celcius=$(echo "$current_data" | jq '.TempC')
current_temp_fahrenheit=$(echo "1.8 * $current_temp_celcius + 32" | bc)
conditions=$(echo "$current_data" | jq '.Desc' | sed 's/"//g')

# Title case conditions: https://stackoverflow.com/a/50806120/8740440
conditions=( $conditions ) # without quotes
conditions=${conditions[@]^}

echo "$conditions - $current_temp_fahrenheit°F"
echo "fix me!"
# echo "hi"

# curl "wttr.in/?format=%l:+%C+%t&u" 2>/dev/null | cut -d":" -f 2 | xargs

# If your tmux status line supports emojis
# curl "wttr.in/?format=3&u" 2>/dev/null | xargs
