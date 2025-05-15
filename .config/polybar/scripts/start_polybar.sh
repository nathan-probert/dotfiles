#!/bin/bash

# Kill any existing polybar instances
killall -q polybar

# Wait for processes to shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar with the example bar
polybar main &

# Start picom with your config file
picom --config ~/.config/picom/picom.conf &
