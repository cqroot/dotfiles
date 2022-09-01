#!/usr/bin/env sh

mem_usage() {
    grep -E 'MemTotal|MemAvailable' /proc/meminfo | awk '{print $2}' | xargs | awk '{printf ("%d%%", 100-$2/$1*100)}'
}

printf " %s" "$(mem_usage)"
