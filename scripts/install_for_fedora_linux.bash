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
    cascadia-code-nf-fonts \
    chezmoi \
    fish \
    fzf \
    ghostty \
    git \
    git-delta \
    go \
    lazygit \
    neovim \
    papirus-icon-theme \
    python3-pip \
    ripgrep \
    sqlite \
    starship \
    vim \
    zoxide

sudo dnf remove -y \
    gnome-connections \
    gnome-contacts \
    gnome-maps \
    gnome-tour

sudo dnf autoremove -y

sudo flatpak remote-modify --disable fedora
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-modify flathub --url=https://mirrors.ustc.edu.cn/flathub
# sudo flatpak remote-modify flathub --url=https://mirrors.sjtug.sjtu.edu.cn/flathub

# flatpak install -y flathub com.brave.Browser
flatpak install -y flathub com.github.hluk.copyq
flatpak install -y flathub com.mattjakeman.ExtensionManager
flatpak install -y flathub com.google.Chrome
flatpak install -y flathub com.visualstudio.code
flatpak install -y flathub io.mpv.Mpv
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub org.flameshot.Flameshot
flatpak install -y flathub org.mozilla.thunderbird
