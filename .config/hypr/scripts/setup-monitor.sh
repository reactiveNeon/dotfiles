#!/bin/bash

set -e

file_path=$HOME/.config/hypr/db/refresh-rate
refresh_rate=$(< "$file_path")

echo $refresh_rate

hyprctl keyword monitor ,1920x1080@$refresh_rate,auto,1