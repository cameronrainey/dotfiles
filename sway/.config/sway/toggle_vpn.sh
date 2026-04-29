#!/bin/bash
# toggle_vpn.sh

# Check if protonvpn is currently connected
# Note: Using `protonvpn status` to check connection state.
if protonvpn status | grep -q "Connected"; then
    notify-send "Proton VPN" "Disconnecting..."
    protonvpn disconnect
    notify-send "Proton VPN" "Disconnected"
else
    notify-send "Proton VPN" "Connecting..."
    protonvpn connect
    notify-send "Proton VPN" "Connected"
fi
