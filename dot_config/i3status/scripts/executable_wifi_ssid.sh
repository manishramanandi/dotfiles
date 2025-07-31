#!/bin/bash

MAX_LENGTH=15 # Adjust this number to your preference

# Get the active Wi-Fi connection's SSID using iwgetid
# Replace 'wlan0' with your actual wireless interface if it's different.
# You can find your interface name using `ip a` or `ifconfig`.
INTERFACE="wlan0" # <--- IMPORTANT: Verify your wireless interface name!
SSID=$(iwgetid -r $INTERFACE 2>/dev/null) # -r for raw SSID, redirect stderr to /dev/null

# Check if SSID is empty (not connected to Wi-Fi or interface down)
if [ -z "$SSID" ]; then
    echo "Disconnected"
else
    # Truncate the SSID if it's too long
    if [ ${#SSID} -gt $MAX_LENGTH ]; then
        TRUNCATED_SSID="${SSID:0:$MAX_LENGTH}..."
    else
        TRUNCATED_SSID="$SSID"
    fi

    echo "W: $TRUNCATED_SSID"
fi
