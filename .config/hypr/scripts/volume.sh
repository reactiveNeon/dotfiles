#!/bin/bash

get_volume_percent() {
    output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    val=$(echo $output | awk -F'[: ]+' '{print $2}')
    res=$(echo $val*100 | bc | cut -d'.' -f1)
    echo $res
}

increase_volume() {
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
}

decrease_volume() {
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-
}

toggle_mute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}

toggle_mic() {
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
}

case ${1,,} in
    --get | --get-vol)
        get_volume_percent
        ;;
    --inc)
        increase_volume
        ;;
    --dec)
        decrease_volume
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