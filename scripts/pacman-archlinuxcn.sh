#!/usr/bin/env bash

echo '
[archlinuxcn]
SigLevel = Optional TrustedOnly
# Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
' >> /etc/pacman.conf

pacman -S --noconfirm --needed --disable-download-timeout archlinuxcn-keyring
pacman -Syyu
