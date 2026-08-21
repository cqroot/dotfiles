#!/usr/bin/env bash

if [ ! -f /etc/arch-release ]; then
    echo "This script is only for Arch Linux. Exiting."
    exit 0
fi

readonly PACKAGES=(
    bash-language-server
    gopls
    kdl-lsp
    kdlfmt
    lua-language-server
    prettier
    pyright
    python-black
    shellcheck
    shfmt
    stylua
)

sudo pacman -Sy --noconfirm --needed "${PACKAGES[@]}"
