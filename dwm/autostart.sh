#!/usr/bin/env bash

# Set statusbar
while true; do
    SINK=$(pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1)
    VOL=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(($SINK + 1)) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

    MEM=$(grep -E 'MemTotal|MemAvailable' /proc/meminfo | awk '{print $2}' | xargs | awk '{printf ("%d%%", 100-$2/$1*100)}')
    CPU=$(grep 'cpu ' /proc/stat | awk '{printf ("%d%%", ($2+$4)/($2+$4+$5)*100)}')
    DATE=$(date "+%a %b %d %H:%M")
    xsetroot -name "墳 ${VOL}%   ${MEM}   ${CPU}  ${DATE}"
    sleep 1s
done &

sh ~/.bin/autostart.sh &
