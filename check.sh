#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

function echo_comment() {
    printf "\033[0;32m# %s\033[0m\n" "$*"
}

function echo_error() {
    printf "\033[0;31m# %s\033[0m\n" "$*"
}

function echo_fatal() {
    printf "\033[0;31m# %s\033[0m\n" "$*"
    exit 1
}

# Detect current OS
OS="unknown"
case "${OSTYPE}" in
"linux-gnu"*)
    OS=linux
    ;;
"darwin"*)
    echo_fatal "Does not support darwin"
    ;;
"cygwin" | "msys" | "win32")
    OS=windows
    ;;
*)
    echo_fatal "Unknown OS"
    ;;
esac
echo_comment "Current OS is ${OS}."

function diff_f() {
    local src=$1
    local dst=$2

    local src_md5sum=$(md5sum -z "${src}" | awk '{print $1}')
    local dst_md5sum=$(md5sum -z "${dst}" | awk '{print $1}')

    if [[ "${src_md5sum}" != "${dst_md5sum}" ]]; then
        echo_comment "${src} (${src_md5sum}) != $dst (${dst_md5sum})"
        echo "mkdir -p \"$(dirname "${dst}")\""
        echo "cp -av \"${src}\" \"${dst}\""
        return 0
    fi
}

function check_f() {
    local name=$1
    local src=$2
    if [[ ! -f "${src}" ]]; then
        echo_error "${name}: ${src} does not exist"
        return 1
    fi

    local dst
    if [[ "${OS}" == "linux" ]]; then
        dst=$3
    elif [[ "${OS}" == "windows" ]]; then
        dst=$4
    fi

    if [[ ! -f "${dst}" ]]; then
        echo_comment "${name}: ${dst} does not exist"
        echo "mkdir -p \"$(dirname "${dst}")\""
        echo "cp -av \"${src}\" \"${dst}\""
        return 0
    fi

    diff_f "${src}" "${dst}"
    if [[ $? -eq 0 ]]; then
        echo_comment "- ${name}: OK"
    fi

    return 0
}

function check_d() {
    local name=$1
    local src=$2
    if [[ ! -d "${src}" ]]; then
        echo_error "${name}: ${src} does not exist"
        return 1
    fi

    local dst
    if [[ "${OS}" == "linux" ]]; then
        dst=$3
    elif [[ "${OS}" == "windows" ]]; then
        dst=$4
    fi

    if [[ ! -d "${dst}" ]]; then
        echo_comment "${name}: ${dst} does not exist"
        echo "mkdir -p \"$(dirname "${dst}")\""
        echo "cp -av \"${src}\" \"${dst}\""
        return 0
    fi

    local all_ok=true
    for file in $(find "${src}" -type f); do
        diff_f "${file}" "${dst}/${file#${src}/}"
        if [[ $? -ne 0 ]]; then
            all_ok=false
        fi
    done

    if [[ "${all_ok}" == true ]]; then
        echo_comment "- ${name}: OK"
    fi
    return 0
}

check_f  "Git"      "${SCRIPT_DIR}/git/.gitconfig"      "${HOME}/.gitconfig"                  "${HOME}/.gitconfig"
check_f  "Go"       "${SCRIPT_DIR}/go/env"              "${HOME}/.config/go/env"              "${APPDATA}/go/env"
check_f  "Lazygit"  "${SCRIPT_DIR}/lazygit/config.yml"  "${HOME}/.config/lazygit/config.yml"  "${LOCALAPPDATA}/lazygit/config.yml"
check_d  "mpv"      "${SCRIPT_DIR}/mpv"                 "${HOME}/.config/mpv"                 "${APPDATA}/mpv"
