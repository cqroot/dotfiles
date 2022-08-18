#!/usr/bin/env bash

# *********************************************************
# System                                                  *
# *********************************************************
pacman -S --noconfirm sxhkd
pacman -S --noconfirm pavucontrol
pacman -S --noconfirm xautolock
pacman -S --noconfirm xsecurelock
pacman -S --noconfirm lxappearance
pacman -S --noconfirm tk
pacman -S --noconfirm dunst
pacman -S --noconfirm network-manager-applet
# yay -S --noconfirm picom-jonaburg-git

# *********************************************************
# Terminals                                               *
# *********************************************************
pacman -S --noconfirm alacritty tmux

# File manager
pacman -S --noconfirm nemo

# Internet
pacman -S --noconfirm firefox
pacman -S --noconfirm mailspring

# *********************************************************
# Appearance                                              *
# *********************************************************
pacman -S --noconfirm arc-gtk-theme
pacman -S --noconfirm bibata-cursor-theme

# *********************************************************
# Fonts                                                   *
# *********************************************************
pacman -S --noconfirm ttf-cascadia-code
pacman -S --noconfirm nerd-fonts-cascadia-code
pacman -S --noconfirm noto-fonts-emoji
pacman -S --noconfirm adobe-source-han-sans-cn-fonts
pacman -S --noconfirm wqy-microhei

# *********************************************************
# Text editor                                             *
# *********************************************************
pacman -S --noconfirm xed
pacman -S --noconfirm vim
yay -S --noconfirm sublime-text-4

pacman -S --noconfirm nutstore
yay -S --noconfirm clash-for-windows-bin
yay -S --noconfirm baidunetdisk-electron

# *********************************************************
# Development                                             *
# *********************************************************
pacman -S --noconfirm meld

# *********************************************************
# Communication                                           *
# *********************************************************
pacman -S --noconfirm telegram-desktop

# *********************************************************
# Image viewer                                            *
# *********************************************************
pacman -S --noconfirm feh
pacman -S --noconfirm nomacs
pacman -S --noconfirm xviewer

# *********************************************************
# Multimedia                                              *
# *********************************************************
pacman -S --noconfirm mpv
pacman -S --noconfirm vlc

# *********************************************************
# Note-taking                                             *
# *********************************************************
pacman -S --noconfirm obsidian
pacman -S --noconfirm notion-app-enhanced

# *********************************************************
# Rofi                                                    *
# *********************************************************
pacman -S --noconfirm rofi rofi-calc rofi-emoji
