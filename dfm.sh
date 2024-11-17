#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

declare -A DOTFILES_LINUX=(
    ["bash"]="${HOME}/.config/bash"
    ["git/config"]="${HOME}/.gitconfig"
    ["go/env"]="${HOME}/.config/go/env"
    ["lazygit"]="${HOME}/.config/lazygit"
    ["mpv"]="${HOME}/.config/mpv"
    ["nvim"]="${HOME}/.config/nvim"
    ["wezterm"]="${HOME}/.config/wezterm"
)

declare -A DOTFILES_WINDOWS=(
    ["bash"]="${HOME}/.config/bash"
    ["git/config"]="${HOME}/.gitconfig"
    ["go/env"]="${APPDATA}/go/env"
    ["lazygit"]="${APPDATA}/lazygit"
    ["mpv"]="${APPDATA}/mpv"
    ["nvim"]="${LOCALAPPDATA}/nvim"
    ["pwsh"]="${HOME}/Documents/WindowsPowerShell"
    ["wezterm"]="${HOME}/.config/wezterm"
)

declare -A DOTFILES

function diff_target() {
    local name=$1
    if [[ "$1" == *"/"* ]]; then
        name=$(echo "$1" | awk -F/ '{print $1}')
    fi

    difft --skip-unchanged --exit-code "${SCRIPT_DIR}/$1" "$2"
    if [[ $? -ne 0 ]]; then
        echo -ne "\e[31mDIFF\e[0m"
        printf " %8s:  %-35s   %s\n" "${name}" "${SCRIPT_DIR}/$1" "$2"
        return
    fi
    echo -ne "\e[32mOK  \e[0m"
    printf " %8s:  %-35s   %s\n" "${name}" "${SCRIPT_DIR}/$1" "$2"
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
            diff_target "${name}" "${DOTFILES_LINUX[${name}]}"
        done
        ;;
    msys | cygwin | win*)
        echo "* Current OS: Windows"
        for name in "${!DOTFILES_WINDOWS[@]}"; do
            diff_target "${name}" "$(cygpath "${DOTFILES_WINDOWS[${name}]}")"
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
