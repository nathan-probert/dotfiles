#!/bin/bash

# Load colors
source ~/.config/polybar/scripts/colors.sh

color="$primary"  # Use the primary color from colors.sh

if playerctl -p spotify status &>/dev/null; then
  artist=$(playerctl -p spotify metadata artist)
  title=$(playerctl -p spotify metadata title)
  status=$(playerctl -p spotify status)
  icon_char=""
  [[ "$status" == "Paused" ]] && icon_char=""
  icon="%{F$color}$icon_char%{F-}"

  max_len=20
  artist="${artist:0:max_len}"
  title="${title:0:max_len}"
  [[ ${#artist} -eq $max_len ]] && artist="${artist}…"
  [[ ${#title} -eq $max_len ]] && title="${title}…"

  printf "%s %s - %s\n" "$icon" "$title" "$artist"
else
  echo ""
fi
