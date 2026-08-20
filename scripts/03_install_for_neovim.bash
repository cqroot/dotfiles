#!/usr/bin/env bash

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
