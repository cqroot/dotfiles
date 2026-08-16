#!/usr/bin/env bash

sudo pacman -Sy --noconfirm --needed \
    bash-language-server \
    gopls \
    kdl-lsp \
    kdlfmt \
    lua-language-server \
    prettier \
    pyright \
    python-black \
    shellcheck \
    shfmt \
    stylua
