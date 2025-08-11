#!/usr/bin/env bash

readonly TUI_PACKAGES=(
    bat
    fzf
    git-delta
    lazygit
    neovim
    ripgrep
    tmux
    yazi
)

readonly GUI_PACKAGES=(
    ghostty
    mpv
    thunderbird
    ttf-cascadia-code-nerd
    zen-browser-bin:aur
)

readonly PL_PACKAGES=(
    # For C/C++
    clang
    cmake
    neocmakelsp:aur
    ninja

    # For Go
    delve
    go
    go-tools
    gofumpt
    golangci-lint
    golines:aur
    gopls

    # For Lua
    lua-language-server

    # For Shell
    bash-language-server
    shellcheck
    shfmt

    # Others
    prettier
)

function install_packages() {
    local pacman_pkgs=()
    local yay_pkgs=()
    for pkg in "$@"; do
        if [[ "${pkg}" == *:aur ]]; then
            yay_pkgs+=("${pkg%%:aur}")
        else
            pacman_pkgs+=("${pkg}")
        fi
    done

    set -x
    sudo pacman -S --noconfirm --needed "${pacman_pkgs[@]}"
    yay -S --noconfirm --needed "${yay_pkgs[@]}"
    set +x
}

function main() {
    install_packages "${GUI_PACKAGES[@]}" "${TUI_PACKAGES[@]}" "${PL_PACKAGES[@]}"
}

main
