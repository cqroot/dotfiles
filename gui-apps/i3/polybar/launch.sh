#!/usr/bin/env bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ "$(xrandr | grep -c "connected")" -gt 1 ]; then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        if [ "$m" == "HDMI-1" ]; then
            MAINMON=$m polybar --reload main &
        else
            NOTRAYMON=$m polybar --reload notray &
        fi
    done
else
    polybar main 2>&1 | tee -a /tmp/polybar.log &
fi
disown
