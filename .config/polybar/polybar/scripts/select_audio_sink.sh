#!/bin/bash

# Get list of sinks: name + description
sinks=$(pactl list short sinks | cut -f1)  # Just get the index IDs
declare -A labels

# Assign friendly labels
while IFS= read -r sink_id; do
    name=$(pactl list sinks | grep -A20 "Sink #$sink_id" | grep 'Name:' | awk '{print $2}')
    desc=$(pactl list sinks | grep -A20 "Sink #$sink_id" | grep 'Description:' | sed 's/.*Description: //')

    if [[ $desc == *"Analog Stereo"* ]]; then
        labels["$name"]="Headphones"
    elif [[ $desc == *"HDMI"* ]]; then
        labels["$name"]="Monitor (HDMI)"
    elif [[ $desc == *"DisplayPort"* || $desc == *"DP"* ]]; then
        labels["$name"]="Monitor (DP)"
    else
        labels["$name"]="$desc"
    fi
done <<< "$sinks"

# Show menu
choice=$(printf "%s\n" "${labels[@]}" | rofi -dmenu -p "Audio Output")

# Get the sink name from the label
for name in "${!labels[@]}"; do
    if [[ "${labels[$name]}" == "$choice" ]]; then
        pactl set-default-sink "$name"
        # Also move all current audio streams to this sink
        for input in $(pactl list short sink-inputs | cut -f1); do
            pactl move-sink-input "$input" "$name"
        done
        break
    fi
done
