#!/usr/bin/env sh

volume() {
    SINK_NAME=$(pactl info | grep 'Default Sink:' | awk -F. '{print $NF}')

    if [ "$SINK_NAME" = "analog-stereo" ]; then
        printf " "
    else
        printf "蓼 "
    fi
    SINK=$(pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1)
    VOLUME=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $((SINK + 1)) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
    if [ "$VOLUME" -eq 0 ]; then
        printf "婢"
    else
        printf "墳"
    fi
    echo " ${VOLUME}%"
}

printf "%s" "$(volume)"
