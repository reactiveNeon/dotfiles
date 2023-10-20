#!/bin/bash

increase_display_brightness() {
    xbacklight -inc 5
}

decrease_display_brightness() {
    xbacklight -dec 5
}

if [[ $1 = "--inc" ]]; then
    increase_display_brightness
elif [[ $1 = "--dec" ]]; then
    decrease_display_brightness
fi