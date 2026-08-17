#!/usr/bin/env bash

# Fonts
sudo pacman -Sy --noconfirm --needed \
    noto-fonts \
    noto-fonts-emoji \
    noto-fonts-cjk \
    ttf-liberation \
    ttf-dejavu \
    ttf-cascadia-code-nerd \
    ttf-firacode-nerd

sudo pacman -Sy --noconfirm --needed \
    dms-shell-niri \
    dolphin \
    fcitx5 \
    fcitx5-configtool \
    fcitx5-rime \
    niri \
    swayidle

sudo pacman -Sy --noconfirm --needed \
    cava \
    matugen
