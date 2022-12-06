#!/usr/bin/env bash

feh --bg-fill "$HOME/Pictures/wallpaper" &

pgrep -x fcitx >/dev/null || fcitx &
pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x cfw >/dev/null || cfw &
pgrep -x nutstore >/dev/null || nutstore &
pgrep -x telegram-desktop >/dev/null || telegram-desktop -startintray &
pgrep -x mailspring >/dev/null || mailspring --background &
pgrep -x joplin-desktop >/dev/null || joplin-desktop &
pgrep -x flameshot >/dev/null || flameshot &
# pgrep -x albert >/dev/null || albert &
pgrep -x firefox >/dev/null || firefox &
