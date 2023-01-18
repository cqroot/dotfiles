#!/usr/bin/env bash

HDMI=""
MON=""
for i in $(xrandr | grep -w connected | awk '{print $1}'); do
	if [[ $i == HDMI* ]]; then
		HDMI=$i
	else
		MON=$i
	fi
done
if [[ -n $HDMI ]]; then
	xrandr --output "$HDMI" --auto --primary --output "$MON" --auto --left-of "$HDMI"
fi

feh --bg-fill "$HOME/Pictures/wallpaper" &
pgrep -x fcitx >/dev/null || fcitx &
pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x cfw >/dev/null || cfw &
pgrep -x nutstore >/dev/null || nutstore &
pgrep -x telegram-desktop >/dev/null || telegram-desktop -startintray &
# pgrep -x mailspring >/dev/null || mailspring --background &
pgrep -x joplin-desktop >/dev/null || joplin-desktop &
pgrep -x flameshot >/dev/null || flameshot &
# pgrep -x albert >/dev/null || albert &
pgrep -x firefox >/dev/null || firefox &

setxkbmap -layout us -option ctrl:swapcaps
