#!/usr/bin/env bash

if [ "$(grep -r "RUNNING" /proc/asound | wc -l)" -eq 0 ]; then
    blurlock
    xset dpms force off
fi
