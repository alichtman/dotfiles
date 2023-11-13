#!/bin/bash

song_data=$(sp.sh metadata)
title=$(echo "$song_data" | grep title | cut -d"|" -f2 | sed 's/\(.\{27\}\).*/\1.../')
artist=$(echo "$song_data" | grep artist | cut -d"|" -f2 | sed 's/\(.\{15\}\).*/\1.../')

echo "♫ $title - $artist"
