#!/usr/bin/env bash

# dev
pacman -S base-devel nodejs npm go
# ops
pacman -S strace net-tools
# other
pacman -S \
    yay vim \
    ttf-cascadia-code noto-fonts-emoji \
    tmux ranger fzf neofetch ripgrep bottom tig bat glow

yay -S google-chrome

# i3wm
pacman -S i3-gaps i3exit xautolock polybar feh tk lxappearance dunst

# gui
pacman -S telegram-desktop obsidian polybar vlc nutstore

# optional
yay -S baidunetdisk-electron microsoft-edge-stable-bin

# *********************************************************
# neovim **************************************************
# *********************************************************
pacman -S neovim-git nvim-packer-git

pip install -y pynvim

# Bash
pacman -S shfmt shellcheck
# C/CPP
pacman -S uncrustify ccls
# Lua
pacman -S stylua
