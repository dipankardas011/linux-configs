#!/bin/bash
operation=$1

max_volume_pc=100
max_volume_pc_upper_up=90


curr_volume=$(pactl get-sink-volume $(pactl get-default-sink)  | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -n1)

if [[ $operation == "UP" ]]; then

    if [[ $curr_volume -le $max_volume_pc_upper_up ]]; then 
        pactl set-sink-volume @DEFAULT_SINK@ +10% && notify-send "Sound level: $(pactl get-sink-volume $(pactl get-default-sink)  | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -n1)" && $refresh_i3status

    else
        diff=$(( $max_volume_pc - $curr_volume ))
        pactl set-sink-volume @DEFAULT_SINK@ +$diff% && notify-send "Sound level: $(pactl get-sink-volume $(pactl get-default-sink)  | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -n1)" && $refresh_i3status
    fi

elif [[ $operation == "DOWN" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -10% && notify-send "Sound level: $(pactl get-sink-volume $(pactl get-default-sink)  | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -n1)" && $refresh_i3status

else
    notify-send "INVALID OPERATION on sound"
fi
