#!/usr/bin/env bash

if ! grep -q '^fastestmirror=' /etc/dnf/dnf.conf; then
    echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
else
    sudo sed -i 's/^fastestmirror=.*$/fastestmirror=True/' /etc/dnf/dnf.conf
fi
echo "fastestmirror=True"

sudo dnf install -y "https://mirrors.ustc.edu.cn/rpmfusion/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" "https://mirrors.ustc.edu.cn/rpmfusion/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf update -y

sudo dnf copr enable -y scottames/ghostty
sudo dnf copr enable -y dejan/lazygit
sudo dnf copr enable -y atim/starship
sudo dnf install -y \
    bat \
    chezmoi \
    copyq \
    fish \
    fzf \
    ghostty \
    git \
    git-delta \
    go \
    lazygit \
    mpv \
    python3-pip \
    ripgrep \
    sqlite \
    starship \
    thunderbird \
    vim \
    zoxide

sudo flatpak remote-modify flathub --url=https://mirrors.ustc.edu.cn/flathub
# sudo flatpak remote-modify flathub --url=https://mirrors.sjtug.sjtu.edu.cn/flathub
