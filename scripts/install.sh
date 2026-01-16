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
    goreleaser-bin:aur

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
    local aur_pkgs=()

    local aur_cmd=""
    if command -v yay >/dev/null 2>&1; then
        aur_cmd=yay
    elif command -v paru >/dev/null 2>&1; then
        aur_cmd=paru
    else
        echo "ERROR: No available aur command (yay or paru)."
        return 1
    fi

    for pkg in "$@"; do
        if [[ "${pkg}" == *:aur ]]; then
            aur_pkgs+=("${pkg%%:aur}")
        else
            pacman_pkgs+=("${pkg}")
        fi
    done

    set -x
    sudo pacman -S --noconfirm --needed "${pacman_pkgs[@]}"
    "${aur_cmd}" -S --noconfirm --needed "${aur_pkgs[@]}"
    set +x
}

function main() {
    install_packages "${GUI_PACKAGES[@]}" "${TUI_PACKAGES[@]}" "${PL_PACKAGES[@]}"
}

main
