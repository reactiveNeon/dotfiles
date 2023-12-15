#!/bin/bash

set -e

DB_PATH=$HOME/.config/hypr/db
REFRESH_RATE=$(< $DB_PATH/refresh-rate)
CUSTOM_POWER_SAVE_MODE=$(< $DB_PATH/custom-power-save-mode)

get_wallpaper_path() {
    local path=$(swww query | awk -F'image: ' '{print $2}')
    echo "$path"
}

while true; do
    random_path=$(find $WALLPAPER_PATH -type f | shuf -n 1)

    if [[ "$random_path" != "$(get_wallpaper_path)" ]]; then
        break
    fi    
done

if [[ "$CUSTOM_POWER_SAVE_MODE" -eq 1 ]]; then
    swww img "$random_path" --transition-type none
else
    swww img "$random_path" --transition-type any --transition-fps $REFRESH_RATE
fi
