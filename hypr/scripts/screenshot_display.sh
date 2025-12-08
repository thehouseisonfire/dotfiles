#!/bin/bash
# .config/hypr/scripts/screenshot_display.sh
# Screenshot the current display Shift+Print

DIR="$HOME/Screenshots"
mkdir -p "$DIR"

output_id=$(hyprctl -t get_outputs | jq -r '.[] | select(.focused).name')
OUT="$DIR/$(date +%F_%H-%M-%S).png"

grim -o "$output_id" "$OUT" && swappy -f "$OUT"
