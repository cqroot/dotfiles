#!/usr/bin/env bash

pacman -S --noconfirm base-devel strace net-tools
pacman -S --noconfirm nodejs npm go
pacman -S --noconfirm yay vim tmux ranger fzf neofetch ripgrep glow htop
pacman -S --noconfirm pavucontrol

pacman -S --noconfirm firefox alacritty clash nemo
pacman -S --noconfirm telegram-desktop obsidian mpv vlc nutstore
# rofi
pacman -S --noconfirm rofi rofi-calc rofi-emoji
# fonts
pacman -S --noconfirm \
    ttf-cascadia-code nerd-fonts-cascadia-code noto-fonts-emoji

# wm
pacman -S --noconfirm lxappearance xautolock xsecurelock feh tk dunst
yay    -S --noconfirm picom-jonaburg-git

# appearance
pacman -S --noconfirm bibata-cursor-theme

# yay
yay    -S --noconfirm \
    clash-for-windows-bin \
    baidunetdisk-electron \
    sublime-text-4

# *********************************************************
# neovim **************************************************
# *********************************************************
pacman -S --noconfirm neovim nvim-packer-git python-pynvim

# Bash
pacman -S --noconfirm shfmt shellcheck
# C/CPP
pacman -S --noconfirm uncrustify ccls
# CMake
yay    -S --noconfirm python-cmakelang
# Lua
pacman -S --noconfirm stylua
# Python
pacman -S --noconfirm python-black
# Others
pacman -S --noconfirm prettier
