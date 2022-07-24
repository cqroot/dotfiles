#!/usr/bin/env bash

pacman -S --noconfirm \
    yay vim base-devel nodejs npm \
    ttf-cascadia-code noto-fonts-emoji \
    tmux fzf neofetch ripgrep bottom tig bat glow

# gui
pacman -S --noconfirm telegram-desktop obsidian polybar vlc nutstore
# i3wm
pacman -S --noconfirm polybar feh tk

# *********************************************************
# neovim **************************************************
# *********************************************************
pacman -S --noconfirm neovim-git nvim-packer-git

pip install -y pynvim

# Bash
pacman -S --noconfirm shfmt
# C/CPP
pacman -S --noconfirm uncrustify ccls
# Lua
pacman -S --noconfirm stylua
