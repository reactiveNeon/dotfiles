#!/bin/bash

set -e

ICON_DIR="$HOME/.config/dunst/icons"

DB_PATH=$HOME/.config/hypr/db/refresh-rate

REFRESH_RATE=$(< $DB_PATH)

notify_user() {
    if [[ "$REFRESH_RATE" -eq 60 ]]; then
        notify-send -i "$ICON_DIR/toggle-on.png" "Custom Power Save Mode" "Enabled"
    else
        notify-send -i "$ICON_DIR/toggle-off.png" "Custom Power Save Mode" "Disabled"
    fi
}

if [[ "$REFRESH_RATE" -eq 144 ]]; then
    REFRESH_RATE=60
else
    REFRESH_RATE=144
fi

hyprctl keyword monitor ,1920x1080@$REFRESH_RATE,auto,1

echo "$REFRESH_RATE" > $DB_PATH

notify_user