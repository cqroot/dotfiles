#!/usr/bin/env bash

sudo pacman -Syyu --noconfirm && \
sudo pacman -Sy --noconfirm --needed \
    bat \
    chezmoi \
    copyq \
    fish \
    fzf \
    ghostty \
    git \
    gnome-tweaks \
    go \
    lazygit \
    mpv \
    python-pip \
    ripgrep \
    sqlite3 \
    starship \
    thunderbird \
    vim \
    zoxide
