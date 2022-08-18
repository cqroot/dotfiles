#!/usr/bin/env bash

pacman -S --noconfirm yay
pacman -S --noconfirm base-devel
pacman -S --noconfirm strace
pacman -S --noconfirm net-tools

pacman -S --noconfirm nodejs
pacman -S --noconfirm npm
pacman -S --noconfirm go

pacman -S --noconfirm clash
pacman -S --noconfirm neofetch
pacman -S --noconfirm ripgrep
pacman -S --noconfirm ranger
pacman -S --noconfirm fzf
pacman -S --noconfirm htop
pacman -S --noconfirm glow

# zsh
pacman -S --noconfirm oh-my-zsh-git

# neovim
pacman -S --noconfirm neovim
pacman -S --noconfirm nvim-packer-git
pacman -S --noconfirm python-pynvim
pacman -S --noconfirm ctags

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
