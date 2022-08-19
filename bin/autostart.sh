#!/bin/bash

pgrep -x sxhkd >/dev/null || sxhkd &
feh --bg-fill /home/cqroot/Pictures/wallpaper &

pgrep -x dunst >/dev/null || dunst &
pgrep -x xautolock >/dev/null ||
    xautolock -time 30 -corners 00+- -cornerdelay 1 -locker "sh ~/.bin/lock.sh" &
pgrep -x fcitx >/dev/null || fcitx &
pgrep -x nm-applet >/dev/null || nm-applet &

pgrep -x cfw >/dev/null || cfw &
pgrep -x nutstore >/dev/null || nutstore &
pgrep -x telegram-desktop >/dev/null || telegram-desktop &
pgrep -x mailspring >/dev/null || mailspring &
pgrep -x cherrytree >/dev/null || cherrytree &
pgrep -x flameshot >/dev/null || flameshot &
