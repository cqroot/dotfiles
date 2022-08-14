#!/usr/bin/env bash

pacman -S --noconfirm yay
pacman -S --noconfirm base-devel

# *********************************************************
# Development                                             *
# *********************************************************
pacman -S --noconfirm strace

# *********************************************************
# System                                                  *
# *********************************************************
pacman -S --noconfirm pavucontrol
pacman -S --noconfirm xautolock
pacman -S --noconfirm xsecurelock
pacman -S --noconfirm tk
pacman -S --noconfirm dunst
yay -S --noconfirm picom-jonaburg-git

# *********************************************************
# Programming language                                    *
# *********************************************************
pacman -S --noconfirm nodejs
pacman -S --noconfirm npm
pacman -S --noconfirm go

# *********************************************************
# Text editor                                             *
# *********************************************************
pacman -S --noconfirm xed
pacman -S --noconfirm vim
yay -S --noconfirm sublime-text-4

# *********************************************************
# Terminals                                               *
# *********************************************************
pacman -S --noconfirm alacritty tmux

# *********************************************************
# Internet                                                *
# *********************************************************
pacman -S --noconfirm net-tools
pacman -S --noconfirm firefox
pacman -S --noconfirm mailspring
pacman -S --noconfirm nutstore
pacman -S --noconfirm clash
yay -S --noconfirm clash-for-windows-bin
yay -S --noconfirm baidunetdisk-electron

# *********************************************************
# Communication                                           *
# *********************************************************
pacman -S --noconfirm telegram-desktop

# *********************************************************
# File manager                                            *
# *********************************************************
pacman -S --noconfirm ranger
pacman -S --noconfirm nemo

# *********************************************************
# Image viewer                                            *
# *********************************************************
pacman -S --noconfirm feh
pacman -S --noconfirm nomacs
pacman -S --noconfirm xviewer

# *********************************************************
# Multimedia                                              *
# *********************************************************
pacman -S --noconfirm mpv vlc

# *********************************************************
# Note-taking                                             *
# *********************************************************
pacman -S --noconfirm obsidian
pacman -S --noconfirm notion-app-enhanced
pacman -S --noconfirm glow

# *********************************************************
# Appearance                                              *
# *********************************************************
pacman -S --noconfirm lxappearance
pacman -S --noconfirm bibata-cursor-theme

# *********************************************************
# Fonts                                                   *
# *********************************************************
pacman -S --noconfirm ttf-cascadia-code
pacman -S --noconfirm nerd-fonts-cascadia-code
pacman -S --noconfirm noto-fonts-emoji

# *********************************************************
# Tools                                                   *
# *********************************************************
pacman -S --noconfirm fzf
pacman -S --noconfirm neofetch
pacman -S --noconfirm ripgrep
pacman -S --noconfirm htop

# *********************************************************
# Rofi                                                    *
# *********************************************************
pacman -S --noconfirm rofi rofi-calc rofi-emoji

# *********************************************************
# Neovim                                                  *
# *********************************************************
pacman -S --noconfirm neovim
pacman -S --noconfirm nvim-packer-git
pacman -S --noconfirm python-pynvim

# Bash
pacman -S --noconfirm shfmt
pacman -S --noconfirm shellcheck
# C/CPP
pacman -S --noconfirm uncrustify
pacman -S --noconfirm ccls
# CMake
yay -S --noconfirm python-cmakelang
# Lua
pacman -S --noconfirm stylua
# Python
pacman -S --noconfirm python-black
# Others
pacman -S --noconfirm prettier
