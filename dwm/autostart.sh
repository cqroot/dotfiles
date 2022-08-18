#!/usr/bin/env bash

#set statusbar
while true; do
    SINK=$(pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1)
    VOL=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(($SINK + 1)) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

    MEM=$(grep -E 'MemTotal|MemAvailable' /proc/meminfo | awk '{print $2}' | xargs | awk '{printf ("%d%%", 100-$2/$1*100)}')
    CPU=$(grep 'cpu ' /proc/stat | awk '{printf ("%d%%", ($2+$4)/($2+$4+$5)*100)}')
    DATE=$(date "+%Y-%m-%d %a %H:%M:%S")
    xsetroot -name "墳 ${VOL}%   ${MEM}   ${CPU}  ${DATE}"
    sleep 1s
done &

pgrep -x sxhkd >/dev/null || sxhkd &
feh --bg-fill /home/cqroot/Pictures/wallpaper &

pgrep -x dunst >/dev/null || dunst &
pgrep -x xautolock >/dev/null ||
    xautolock -time 10 -corners 00+- -cornerdelay 1 -locker "sh ~/.bin/lock.sh" &
pgrep -x fcitx >/dev/null || fcitx &

pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x pamac-tray >/dev/null || pamac-tray &


pgrep -x cfw >/dev/null || cfw &
pgrep -x nutstore >/dev/null || nutstore &
pgrep -x telegram-desktop >/dev/null || telegram-desktop &
pgrep -x mailspring >/dev/null || mailspring &
pgrep -x cherrytree >/dev/null || cherrytree &
pgrep -x flameshot >/dev/null || flameshot &
