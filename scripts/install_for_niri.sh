#!/usr/bin/env bash

readonly PACKAGES=(
    # Fonts
    noto-fonts             # Sans/serif/mono fonts
    noto-fonts-emoji       # Color emoji font
    noto-fonts-cjk         # Chinese, Japanese, Korean fonts
    ttf-liberation         # Microsoft-compatible fonts
    ttf-dejavu             # DejaVu sans/serif/mono fonts
    ttf-cascadia-code-nerd # CaskaydiaCove Nerd Font
    ttf-firacode-nerd      # FiraCode Nerd Font

    # Login & Compositor
    ly       # TUI login manager
    niri     # Scrollable-tiling Wayland compositor
    swayidle # Idle management daemon for Wayland

    # X11 Compatibility
    xorg-xwayland      # X11 support inside Wayland
    xwayland-satellite # Embed X11 windows into Wayland

    # Desktop Integration
    dms-shell-niri           # Desktop shell UI for niri
    xdg-desktop-portal-gnome # Portal backend for Flatpak/Snap, screenshots, etc.

    # Apps
    alacritty         # GPU-accelerated terminal emulator
    dolphin           # KDE file manager
    fcitx5            # Input method framework
    fcitx5-configtool # Graphical configuration tool for fcitx5
    fcitx5-rime       # Rime input engine
)

sudo pacman -Sy --noconfirm --needed "${PACKAGES[@]}"
