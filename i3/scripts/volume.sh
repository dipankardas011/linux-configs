#!/bin/bash
max_volume_pc=$1
curr_volume=$(pactl get-sink-volume $(pactl get-default-sink)  | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -n1)


if [ $curr_volume -le 90 ]; then 
    pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
else
    diff=$(( $max_volume_pc - $curr_volume ))
    pactl set-sink-volume @DEFAULT_SINK@ +$diff% && $refresh_i3status
fi
