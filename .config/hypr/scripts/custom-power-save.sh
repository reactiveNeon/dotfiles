#!/bin/bash

set -e

ICON_DIR="$HOME/.config/dunst/icons"

DB_PATH=$HOME/.config/hypr/db

CUSTOM_POWER_SAVE_MODE=$(< $DB_PATH/custom-power-save-mode)
REFRESH_RATE=$(< $DB_PATH/refresh-rate)
ANIMATIONS=$(< $DB_PATH/animations)

notify_user() {
    if [[ "$CUSTOM_POWER_SAVE_MODE" -eq 1 ]]; then
        notify-send -i "$ICON_DIR/toggle-on.png" -h "string:x-dunst-stack-tag:custom_power_save_notif" "Custom Power Save Mode" "Enabled"
    else
        notify-send -i "$ICON_DIR/toggle-off.png" -h "string:x-dunst-stack-tag:custom_power_save_notif" "Custom Power Save Mode" "Disabled"
    fi
}

case "$CUSTOM_POWER_SAVE_MODE" in
    0)
        CUSTOM_POWER_SAVE_MODE=1
        REFRESH_RATE=60
        ANIMATIONS=0
        ;;
    1)
        CUSTOM_POWER_SAVE_MODE=0
        REFRESH_RATE=144
        ANIMATIONS=1
        ;;
esac

hyprctl keyword monitor ,1920x1080@$REFRESH_RATE,auto,1
hyprctl keyword animations:enabled $ANIMATIONS

echo "$REFRESH_RATE" > $DB_PATH/refresh-rate
echo "$ANIMATIONS" > $DB_PATH/animations
echo "$CUSTOM_POWER_SAVE_MODE" > $DB_PATH/custom-power-save-mode

notify_user