#!/usr/bin/env bash

pacman -S --noconfirm --disable-download-timeout yay
pacman -S --noconfirm --disable-download-timeout base-devel
pacman -S --noconfirm --disable-download-timeout strace
pacman -S --noconfirm --disable-download-timeout net-tools

pacman -S --noconfirm --disable-download-timeout nodejs
pacman -S --noconfirm --disable-download-timeout npm
pacman -S --noconfirm --disable-download-timeout go

pacman -S --noconfirm --disable-download-timeout clash
pacman -S --noconfirm --disable-download-timeout neofetch
pacman -S --noconfirm --disable-download-timeout ripgrep
pacman -S --noconfirm --disable-download-timeout ranger
pacman -S --noconfirm --disable-download-timeout fzf
pacman -S --noconfirm --disable-download-timeout htop
pacman -S --noconfirm --disable-download-timeout glow

# zsh
pacman -S --noconfirm --disable-download-timeout oh-my-zsh-git

# neovim
pacman -S --noconfirm --disable-download-timeout neovim
pacman -S --noconfirm --disable-download-timeout nvim-packer-git
pacman -S --noconfirm --disable-download-timeout python-pynvim
pacman -S --noconfirm --disable-download-timeout ctags

# Bash
pacman -S --noconfirm --disable-download-timeout shfmt
pacman -S --noconfirm --disable-download-timeout shellcheck
# C/CPP
pacman -S --noconfirm --disable-download-timeout uncrustify
pacman -S --noconfirm --disable-download-timeout ccls
# CMake
yay -S --noconfirm --disable-download-timeout python-cmakelang
# Lua
pacman -S --noconfirm --disable-download-timeout stylua
# Python
pacman -S --noconfirm --disable-download-timeout python-black
# Others
pacman -S --noconfirm --disable-download-timeout prettier
