#!/usr/bin/env bash

lock=" Lock"
logout=" Logout"
poweroff=" Poweroff"
reboot=" Reboot"

echo_list() {
    echo "$lock
$logout
$poweroff
$reboot"
}

res=$(echo_list | rofi -dmenu -i -p "⏻")

if [ "$res" == "$lock" ]; then
    sh ~/.bin/lock.sh
elif [ "$res" == "$logout" ]; then
    loginctl terminate-user "$(whoami)"
elif [ "$res" == "$reboot" ]; then
    reboot
elif [ "$res" == "$poweroff" ]; then
    poweroff
fi
