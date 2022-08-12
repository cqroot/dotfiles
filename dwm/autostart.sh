#!/usr/bin/env bash

#set statusbar
while true; do
    SINK=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
    VVOL=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )

    VMEM=$(grep -E 'MemTotal|MemAvailable' /proc/meminfo | awk '{print $2}' | xargs | awk '{printf ("%.2f%%", 100-$2/$1*100)}')
    VCPU=$(grep 'cpu ' /proc/stat | awk '{printf ("%.2f%%", ($2+$4)/($2+$4+$5)*100)}')
    VDATE=$(date "+%Y-%m-%d %a %H:%M:%S")
    xsetroot -name "墳 ${VVOL}%   ${VMEM}   ${VCPU}  ${VDATE}"
    sleep 1s
done &

picom --experimental-backend &
dunst &
xautolock -time 10 -corners 00+- -cornerdelay 1 -locker "blurlock; xset dpms force off" &
nm-applet &
fcitx &
pamac-tray &

feh --bg-fill /home/cqroot/Pictures/wallpaper &
cfw &
nutstore &
telegram-desktop &
mailspring &
cherrytree &
flameshot &

firefox &
