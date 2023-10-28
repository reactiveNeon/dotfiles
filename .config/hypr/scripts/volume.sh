#!/bin/bash

set -e

ICONS_DIR="$HOME/.config/dunst/icons/vol"

get_vol() {
    local output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    local val=$(echo $output | awk -F'[: ]+' '{print $2}')
    local res=$(echo $val*100 | bc | cut -d'.' -f1)
    echo $res
}

get_icon() {
    local current=$(get_vol)

    local i
    for (( i=5; i<=100; i+=5 )); do
        if [[ "$current" -lt $i ]]; then
            echo "$ICONS_DIR/vol-$((i-5)).svg"
            break
        fi
    done

    if [[ "$current" -eq 100 ]]; then
        echo "$ICONS_DIR/vol-100.svg"
    fi
}

notify_user() {
    local vol=$(get_vol)
    notify-send -a Volume -h int:value:"$vol" -h "string:x-dunst-stack-tag:volume_notif" -u low -i "$(get_icon)" $vol%
}

inc_vol() {
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ $1%+
    notify_user
}

dec_vol() {
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $1%-
    notify_user
}

toggle_mute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}

toggle_mic() {
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
}

case ${1,,} in
    --get | --get-vol)
        get_vol
        ;;
    --inc)
        inc_vol "$2"
        ;;
    --dec)
        dec_vol "$2"
        ;;
    --toggle-mute)
        toggle_mute
        ;;
    --toggle-mic)
        toggle_mic
        ;;
    *)
        echo "Enter a valid option!"
esac