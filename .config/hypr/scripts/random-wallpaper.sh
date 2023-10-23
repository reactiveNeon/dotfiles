#!/bin/bash

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

swww img "$random_path" --transition-type any --transition-fps 144