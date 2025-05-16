#!/bin/bash

options="    Shutdown\n   Reboot\n   Logout\n   Cancel"

choice=$(echo -e "$options" | rofi -dmenu -p "Power" -matching fuzzy -i)

case "$choice" in
  *Shutdown)
    systemctl poweroff
    ;;
  *Reboot)
    systemctl reboot
    ;;
  *Logout)
    i3-msg exit
    ;;
  *Cancel)
    ;;
esac
