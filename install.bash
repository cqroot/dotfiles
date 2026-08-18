#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
readonly SCRIPT_DIR

function main() {
    bash "${SCRIPT_DIR}/scripts/01_install_common.bash" || return
    bash "${SCRIPT_DIR}/scripts/02_install_niri.bash" || return
}

main "$@"
