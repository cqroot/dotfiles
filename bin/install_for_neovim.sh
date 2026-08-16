#!/usr/bin/env bash

sudo pacman -Sy --noconfirm --needed \
    bash-language-server \
    gopls \
    kdl-lsp \
    kdlfmt \
    lua-language-server \
    prettier \
    shfmt \
    stylua
