#!/usr/bin/env bash

sudo pacman -Sy --noconfirm --needed \
    bash-language-server \
    lua-language-server \
    shellcheck

sudo pacman -Sy --noconfirm --needed \
    prettier \
    stylua
