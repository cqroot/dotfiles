#!/usr/bin/env bash

if ! grep -q 'archlinuxcn' /etc/pacman.conf; then
    echo '
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' | sudo tee -a /etc/pacman.conf
    sudo pacman -Syy --noconfirm
    sudo pacman -S --noconfirm --needed archlinuxcn-keyring
fi

sudo pacman -Syyu --noconfirm && \
sudo pacman -Sy --noconfirm --needed \
    bat \
    celluloid \
    chezmoi \
    clash-verge-rev \
    copyq \
    extension-manager \
    fish \
    flameshot \
    flatpak \
    fzf \
    ghostty \
    git \
    git-delta \
    gnome-tweaks \
    go \
    ibus-libpinyin \
    kdl-lsp \
    kdlfmt \
    lazygit \
    mpv \
    neovim \
    nfs-utils \
    noto-fonts-cjk \
    obsidian \
    opencode \
    papirus-icon-theme \
    python-pip \
    ripgrep \
    sqlite3 \
    starship \
    thunderbird \
    ttf-cascadia-code-nerd \
    ttf-firacode-nerd \
    vim \
    zellij \
    zoxide

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-modify flathub --url=https://mirrors.ustc.edu.cn/flathub
# sudo flatpak remote-modify flathub --url=https://mirrors.sjtug.sjtu.edu.cn/flathub

flatpak install -y flathub com.google.Chrome
