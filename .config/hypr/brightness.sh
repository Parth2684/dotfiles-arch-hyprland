#!/bin/bash
# ~/.scripts/brightness.sh

# Check for tool existence
if ! command -v brightnessctl &> /dev/null || ! command -v dunst &> /dev/null; then
    echo "brightnessctl or dunst not found. Please install them."
    exit 1
fi

# Get current brightness and max brightness
CURRENT_BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
STEP=5 # Adjust this for finer/larger steps (e.g., 1 for 1%, 10 for 10%)

case "$1" in
    inc)
        # Increase brightness, capping at max
        NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS + STEP))
        brightnessctl set "$NEW_BRIGHTNESS%"
        ;;
    dec)
        # Decrease brightness, minimum 0
        NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS - STEP))
        brightnessctl set "$NEW_BRIGHTNESS%"
        ;;
esac

# Show notification (optional)
CURRENT_BRIGHTNESS=$(brightnessctl get)
PERCENTAGE=$((CURRENT_BRIGHTNESS * 100 / $(brightnessctl max)))
dunstify -t 1000 -u low "Brightness" "${PERCENTAGE}%"
