#!/usr/bin/env bash

AUR_COMMAND=""
readonly LOG_FILE="./install.log"
readonly RET_ERR=1
readonly RET_NA=2

function log_error() {
    echo "ERROR: $*"
}

function init_env() {
    if command -v yay >/dev/null 2>&1; then
        AUR_COMMAND=yay
    elif command -v paru >/dev/null 2>&1; then
        AUR_COMMAND=paru
    else
        log_error "No available aur command (yay or paru)."
        return 1
    fi
}

function install_pkg() {
    (sudo pacman -S --noconfirm --needed "$1") >>"${LOG_FILE}" 2>&1
}

function install_aur_pkg() {
    "${AUR_COMMAND}" -S --noconfirm --needed "$1" >>"${LOG_FILE}" 2>&1
}

function apply_conf() {
    local src
    src=$(eval echo "$1")
    if [[ ! -e "${src}" ]]; then
        log_error "Source file (${src}) does not exist."
        return "${RET_ERR}"
    fi

    src=$(readlink -f "${src}")
    ret=$?
    if [[ "${ret}" -ne 0 ]]; then
        log_error "Failed to check source file path (src: ${src}, ret: ${ret})."
        return "${RET_ERR}"
    fi

    local dst
    dst=$(eval echo "$2")
    if [[ -e "${dst}" ]]; then
        dst=$(readlink -f "$(eval echo "$2")")
        ret=$?
        if [[ "${ret}" -ne 0 ]]; then
            log_error "Failed to check destination file path (dst: ${dst}, ret: ${ret})."
            return "${RET_ERR}"
        fi

        if [[ "${src}" == "${dst}" ]]; then
            return "${RET_NA}"
        fi

        log_error "Destination file (${dst}) already exists."
        return "${RET_ERR}"
    fi

    local parent_dir
    parent_dir=$(dirname "${dst}")
    ret=$?
    if [[ "${ret}" -ne 0 ]]; then
        log_error "Failed to get parent path (dst: ${dst}, ret: ${ret})."
        return "${RET_ERR}"
    fi

    if [[ ! -d "${parent_dir}" ]]; then
        mkdir -p "${parent_dir}"
    fi

    ln -s "${src}" "${dst}"
}

function handle_line() {
    local line=${1// /}
    if [[ "${line}" == \#* ]]; then
        return 0
    fi

    local pkg src dst ret

    pkg=$(awk -F'[+*:]' '{print $1}' <<<"${line}")
    src=$(awk -F'[:>]' '{print $2}' <<<"${line}")
    dst=$(awk -F'>' '{print $2}' <<<"${line}")
    printf "%-22s " "${pkg}"

    if [[ "${line}" == *"+"* ]]; then
        install_pkg "${pkg}"
        ret=$?
        if [[ "${ret}" -ne 0 ]]; then
            log_error "Failed to install package \"${pkg}\"."
            return 1
        fi
    elif [[ "${line}" == *"\*"* ]]; then
        install_aur_pkg "${pkg}"
        ret=$?
        if [[ "${ret}" -ne 0 ]]; then
            log_error "Failed to install aur package \"${pkg}\"."
            return 1
        fi
    fi

    if [[ -n "${src}" && -n "${dst}" ]]; then
        apply_conf "${src}" "${dst}"
        ret=$?
        if [[ "${ret}" -eq 0 ]]; then
            echo "Applied!"
        elif [[ "${ret}" -eq "${RET_NA}" ]]; then
            echo "OK"
            return 0
        elif [[ "${ret}" -ne 0 ]]; then
            return "${ret}"
        fi
    else
        echo "OK"
    fi
}

function read_config() {
    while read -r line; do
        handle_line "${line}" || return $?
    done <"./apps.conf"
}

function main() {
    init_env || return $?
    read_config
}

main "$@"
