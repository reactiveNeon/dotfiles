#!/bin/bash

set -e

ICONS_DIR="$HOME/.config/dunst/icons/vol"

get_mon() {
    xbacklight -get
}

get_icon() {
    local current=$(get_mon)

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
    local mon=$(get_mon)
    notify-send -a Brightness -h int:value:"$mon" -h "string:x-dunst-stack-tag:volume_notif" -u low -i "$(get_icon)" $mon%
}

inc_mon() {
    xbacklight -inc $1
    notify_user
}

dec_mon() {
    xbacklight -dec $1
    notify_user
}

case ${1,,} in
    --get | --get-monitor)
        get_mon
        ;;
    --inc)
        inc_mon "$2"
        ;;
    --dec)
        dec_mon "$2"
        ;;
    *)
        echo "Enter a valid option!" 
esac