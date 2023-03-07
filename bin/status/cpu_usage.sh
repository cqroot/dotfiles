#!/usr/bin/env sh

cpu_usage() {
    grep 'cpu ' /proc/stat | awk '{printf ("%d%%", ($2+$4)/($2+$4+$5)*100)}'
}

printf " %s" "$(cpu_usage)"
