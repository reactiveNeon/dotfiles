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

if [[ $1 == "--get" ]]; then
	get_volume
elif [[ $1 == "--inc" ]]; then
	increase_volume
elif [[ $1 == "--dec" ]]; then
	decrease_volume
elif [[ $1 == "--toggle-mute" ]]; then
	toggle_mute
elif [[ $1 == "--toggle-mic" ]]; then
	toggle_mic
else
    get_volume
fi