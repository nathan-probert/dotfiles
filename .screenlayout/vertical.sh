#!/bin/bash
# Auto-detects connected outputs and configures them.
# Single output: primary at its preferred mode.
# Multiple outputs: side by side, first one primary, at preferred modes.

set -e

mapfile -t outs < <(xrandr --query | awk '/ connected/{sub(" connected.*","",$0); print $1}')

if [ "${#outs[@]}" -eq 0 ]; then
    echo "No connected outputs found" >&2
    exit 1
fi

if [ "${#outs[@]}" -eq 1 ]; then
    xrandr --output "${outs[0]}" --auto --primary || true
else
    prev=""
    for i in "${!outs[@]}"; do
        out="${outs[$i]}"
        if [ "$i" -eq 0 ]; then
            xrandr --output "$out" --auto --primary --pos 0x0 || true
        else
            xrandr --output "$out" --auto --relative --right-of "$prev" || true
        fi
        prev="$out"
    done
fi

# Wallpapers from ~/Downloads (first found image), only if feh and a file exist
bg=$(ls "$HOME/Downloads"/*.jpg "$HOME/Downloads"/*.png 2>/dev/null | head -1)
if [ -n "$bg" ] && command -v feh >/dev/null; then
    feh --bg-fill "$bg"
fi
