#!/usr/bin/env bash

pacman -S --noconfirm --disable-download-timeout xorg-server

# *********************************************************
# System                                                  *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout sxhkd
pacman -S --noconfirm --disable-download-timeout xclip
pacman -S --noconfirm --disable-download-timeout pavucontrol
pacman -S --noconfirm --disable-download-timeout xautolock
pacman -S --noconfirm --disable-download-timeout xsecurelock
pacman -S --noconfirm --disable-download-timeout lxappearance
pacman -S --noconfirm --disable-download-timeout tk
pacman -S --noconfirm --disable-download-timeout dunst
pacman -S --noconfirm --disable-download-timeout network-manager-applet
# yay -S --noconfirm --disable-download-timeout picom-jonaburg-git
pacman -S --noconfirm --disable-download-timeout flameshot
pacman -S --noconfirm --disable-download-timeout maim

# *********************************************************
# Terminals                                               *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout alacritty tmux

# File manager
pacman -S --noconfirm --disable-download-timeout nemo nemo-fileroller
pacman -S --noconfirm --disable-download-timeout baobab

# Internet
pacman -S --noconfirm --disable-download-timeout firefox
pacman -S --noconfirm --disable-download-timeout mailspring

# *********************************************************
# Appearance                                              *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout arc-gtk-theme
pacman -S --noconfirm --disable-download-timeout bibata-cursor-theme

# *********************************************************
# Fonts                                                   *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout ttf-cascadia-code
pacman -S --noconfirm --disable-download-timeout nerd-fonts-cascadia-code
pacman -S --noconfirm --disable-download-timeout noto-fonts-emoji
pacman -S --noconfirm --disable-download-timeout adobe-source-han-sans-cn-fonts
pacman -S --noconfirm --disable-download-timeout wqy-microhei

# *********************************************************
# Text editor                                             *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout xed
pacman -S --noconfirm --disable-download-timeout vim
yay -S --noconfirm --disable-download-timeout sublime-text-4

pacman -S --noconfirm --disable-download-timeout nutstore
yay -S --noconfirm --disable-download-timeout clash-for-windows-bin
yay -S --noconfirm --disable-download-timeout baidunetdisk-electron
yay -S --noconfirm --disable-download-timeout typora-free

# *********************************************************
# Development                                             *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout meld

# *********************************************************
# Communication                                           *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout telegram-desktop

# *********************************************************
# Image viewer                                            *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout feh
pacman -S --noconfirm --disable-download-timeout nomacs
pacman -S --noconfirm --disable-download-timeout xviewer

# *********************************************************
# Multimedia                                              *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout mpv
pacman -S --noconfirm --disable-download-timeout vlc

# *********************************************************
# Note-taking                                             *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout obsidian
pacman -S --noconfirm --disable-download-timeout notion-app-enhanced

# *********************************************************
# Rofi                                                    *
# *********************************************************
pacman -S --noconfirm --disable-download-timeout rofi rofi-calc rofi-emoji
