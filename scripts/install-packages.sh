#!/usr/bin/env bash

main() {
    SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

    "${SCRIPT_DIR}/00-tui.sh"

    if [ "$1" = "dwm" ]; then
        "${SCRIPT_DIR}/01-gui.sh"
        "${SCRIPT_DIR}/02-dwm.sh"
    fi
}

main "$@"
