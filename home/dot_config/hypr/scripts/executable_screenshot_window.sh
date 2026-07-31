#!/bin/bash
# .config/hypr/scripts/screenshot_window.sh
# Screenshot a window Ctrl+Print

#!/bin/bash
# Screenshot a window (Ctrl+Print) -> ~/Screenshots/<timestamp>.png then open in swappy

DIR="$HOME/Screenshots"
mkdir -p "$DIR"

OUT="$DIR/$(date +%F_%H-%M-%S).png"

GEOM="$(hyprctl -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)"

grim -g "$GEOM" "$OUT" && swappy -f "$OUT"
