#!/bin/bash
# colors.sh - parse colors.ini and export vars

CONFIG_FILE="$HOME/.config/polybar/colors.ini"

eval $(
  sed -n '/^\[colors\]/,/^\[/{/^[a-zA-Z]/p}' "$CONFIG_FILE" | \
  sed -E 's/ *= */=/' | \
  sed -E 's/^([a-zA-Z0-9_-]+)=(.*)$/export \1="\2"/'
)
