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

# i3wm
pacman -S i3-gaps i3exit xautolock polybar feh tk dunst
pacman -S lxappearance papirus-icon-theme

# gui
pacman -S firefox telegram-desktop obsidian polybar vlc nutstore

# optional
yay -S google-chrome
sudo pacman -S netease-cloud-music simplescreenrecorder
yay -S baidunetdisk-electron microsoft-edge-stable-bin sublime-text-4 jetbrains-toolbox

# *********************************************************
# neovim **************************************************
# *********************************************************
pacman -S neovim-git nvim-packer-git

# pip install -y pynvim
pacman -Ss python-pynvim

# Bash
pacman -S shfmt shellcheck
# C/CPP
pacman -S uncrustify ccls
# Lua
pacman -S stylua
# Python
pacman -S python-black
# Others
pacman -S prettier
