#! /bin/bash
# Uses wttr.in and https://github.com/fulldecent/corelocationcli to get weather
# in current location. Only works on macOS.

curl "wttr.in/$(CoreLocationCLI -format "%address" | tail -n+2 | head -n 1 | cut -d" " -f 1)?format=%l:+%C+%t&u" 2>/dev/null | xargs

# If your tmux status line supports emojis
# curl "wttr.in/$(CoreLocationCLI -format "%address" | tail -n+2 | head -n 1 | cut -d" " -f 1)?format=3&u" 2>/dev/null | xargs

