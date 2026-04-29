#!/bin/bash
# toggle_displays.sh
MODE_FILE="/tmp/sway_monitor_mode"

# Initialize file if it doesn't exist
if [ ! -f "$MODE_FILE" ]; then
    echo "laptop" > "$MODE_FILE"
fi

MODE=$(cat "$MODE_FILE")

if [ "$MODE" = "laptop" ]; then
    # Switch to full monitor setup
    swaymsg output DP-5 enable pos 0 0 transform 90
    swaymsg output DP-3 enable pos 1440 560
    swaymsg output DP-4 enable pos 4000 560
    swaymsg output eDP-1 enable pos 0 2560
    swaymsg output DP-2 disable
    echo "full" > "$MODE_FILE"
    notify-send "Sway" "Switched to Full Monitor Setup"
elif [ "$MODE" = "full" ]; then
    # Switch to docked (desktop only) setup
    swaymsg output DP-5 enable pos 0 0 transform 90
    swaymsg output DP-3 enable pos 1440 560
    swaymsg output DP-4 enable pos 4000 560
    swaymsg output eDP-1 disable
    swaymsg output DP-2 disable
    echo "docked" > "$MODE_FILE"
    notify-send "Sway" "Switched to Docked Mode (Laptop Disabled)"
else
    # Switch to laptop only
    swaymsg output DP-4 disable
    swaymsg output DP-3 disable
    swaymsg output DP-5 disable
    swaymsg output DP-2 disable
    swaymsg output eDP-1 enable pos 0 0
    echo "laptop" > "$MODE_FILE"
    notify-send "Sway" "Switched to Laptop Only Mode"
fi