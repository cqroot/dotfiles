#!/usr/bin/env bash

sudo pacman -Syyu --noconfirm && \
sudo pacman -Sy --noconfirm --needed \
    bat \
    chezmoi \
    copyq \
    extension-manager \
    fish \
    flameshot \
    flatpak \
    fzf \
    ghostty \
    git \
    gnome-tweaks \
    go \
    lazygit \
    mpv \
    obsidian \
    python-pip \
    ripgrep \
    sqlite3 \
    starship \
    thunderbird \
    vim \
    zoxide

sudo flatpak remote-modify --disable fedora
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-modify flathub --url=https://mirrors.ustc.edu.cn/flathub
# sudo flatpak remote-modify flathub --url=https://mirrors.sjtug.sjtu.edu.cn/flathub

flatpak install -y flathub com.google.Chrome
