#!/usr/bin/env bash

PACMAN_ARGS=(--noconfirm --noprogressbar --needed --disable-download-timeout)

pacman -S "${PACMAN_ARGS[@]}" yay
pacman -S "${PACMAN_ARGS[@]}" base-devel
pacman -S "${PACMAN_ARGS[@]}" strace
pacman -S "${PACMAN_ARGS[@]}" net-tools

pacman -S "${PACMAN_ARGS[@]}" nodejs
pacman -S "${PACMAN_ARGS[@]}" npm
pacman -S "${PACMAN_ARGS[@]}" go

pacman -S "${PACMAN_ARGS[@]}" clash
pacman -S "${PACMAN_ARGS[@]}" neofetch
pacman -S "${PACMAN_ARGS[@]}" ripgrep
pacman -S "${PACMAN_ARGS[@]}" ranger
pacman -S "${PACMAN_ARGS[@]}" fzf
pacman -S "${PACMAN_ARGS[@]}" htop
pacman -S "${PACMAN_ARGS[@]}" glow

# zsh
pacman -S "${PACMAN_ARGS[@]}" oh-my-zsh-git

# neovim
pacman -S "${PACMAN_ARGS[@]}" neovim
pacman -S "${PACMAN_ARGS[@]}" nvim-packer-git
pacman -S "${PACMAN_ARGS[@]}" python-pynvim
pacman -S "${PACMAN_ARGS[@]}" ctags

# Bash
pacman -S "${PACMAN_ARGS[@]}" shfmt
pacman -S "${PACMAN_ARGS[@]}" shellcheck
# C/CPP
pacman -S "${PACMAN_ARGS[@]}" uncrustify
pacman -S "${PACMAN_ARGS[@]}" ccls
# CMake
yay -S "${PACMAN_ARGS[@]}" python-cmakelang
# Lua
pacman -S "${PACMAN_ARGS[@]}" stylua
# Python
pacman -S "${PACMAN_ARGS[@]}" python-black
# Others
pacman -S "${PACMAN_ARGS[@]}" prettier
