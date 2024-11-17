#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

declare -A DOTFILES_LINUX=(
    ["bash"]="${HOME}/.config/bash"
    ["lazygit"]="${HOME}/.config/lazygit"
    ["mpv"]="${HOME}/.config/mpv"
    ["nvim"]="${HOME}/.config/nvim"
)

declare -A DOTFILES_WINDOWS=(
    ["bash"]="${HOME}/.config/bash"
    ["lazygit"]="${APPDATA}/lazygit"
    ["mpv"]="${APPDATA}/mpv"
    ["nvim"]="${LOCALAPPDATA}/nvim"
    ["pwsh"]="${HOME}/Documents/WindowsPowerShell"
)

declare -A DOTFILES

function diff_dir() {
    difft --check-only --skip-unchanged "${SCRIPT_DIR}/$1" "$2"
    if [[ $? -ne 0 ]]; then
        echo "DIFF  $1:  ${SCRIPT_DIR}/$1 -> $2"
    fi
    echo "OK  $1:  ${SCRIPT_DIR}/$1 -> $2"
}

function apply_dir() {
    echo "$1:  ${SCRIPT_DIR}/$1 -> $2"
    cp -aT "${SCRIPT_DIR}/$1" "$2"
}

function do_status() {
    case "${OSTYPE}" in
    linux*)
        echo "* Current OS: Linux"
        for name in "${!DOTFILES_LINUX[@]}"; do
            diff_dir "${name}" "${DOTFILES_LINUX[${name}]}"
        done
        ;;
    msys | cygwin | win*)
        echo "* Current OS: Windows"
        for name in "${!DOTFILES_WINDOWS[@]}"; do
            diff_dir "${name}" "${DOTFILES_WINDOWS[${name}]}"
        done
        ;;
    *)
        echo "* Current OS: Unknown"
        return 1
        ;;
    esac
}

function do_apply() {
    case "${OSTYPE}" in
    linux*)
        echo "* Current OS: Linux"
        for name in "${!DOTFILES_LINUX[@]}"; do
            apply_dir "${name}" "${DOTFILES_LINUX[${name}]}"
        done
        ;;
    msys | cygwin | win*)
        echo "* Current OS: Windows"
        for name in "${!DOTFILES_WINDOWS[@]}"; do
            apply_dir "${name}" "${DOTFILES_WINDOWS[${name}]}"
        done
        ;;
    *)
        echo "* Current OS: Unknown"
        return 1
        ;;
    esac
}

function main() {
    case "$1" in
    status)
        do_status
        ;;
    apply)
        do_apply
        ;;
    *)
        echo "usage: $0 <command>

The commands are:

        status
        apply
"
        ;;
    esac

}

main "$@"
