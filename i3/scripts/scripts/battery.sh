#!/bin/bash

currBat=$(cat /sys/class/power_supply/BAT0/capacity)

stats=$(cat /sys/class/power_supply/BAT0/status)


if [[ $currBat -lt 80 && $stats = 'Discharging' ]]; then
    # normal mode
    echo "start charging"
    sudo sed -i s/STOP_CHARGE_THRESH_BAT0=1/STOP_CHARGE_THRESH_BAT0=0/g /etc/tlp.conf
    sudo tlp start
elif [[ $currBat -lt 80 && $stats = 'Not charging' ]]; then
    # normal mode
    echo "start charging"
    sudo sed -i s/STOP_CHARGE_THRESH_BAT0=1/STOP_CHARGE_THRESH_BAT0=0/g /etc/tlp.conf
    sudo tlp start
elif [[ $currBat -gt 85 && $stats = 'Charging' ]]; then
    # conservative mode
    echo "stop charging"
    sudo sed -i s/STOP_CHARGE_THRESH_BAT0=0/STOP_CHARGE_THRESH_BAT0=1/g /etc/tlp.conf
    sudo tlp start
else
    echo "No action needed"
fi

echo "--------"
