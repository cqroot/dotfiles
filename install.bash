#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)/scripts
readonly SCRIPT_DIR

function main() {
    for script in "${SCRIPT_DIR}"/*.bash; do
        bash "${script}" || {
            echo "Failed to execute ${SCRIPT_DIR}/${script}"
            return
        }
    done
}

main "$@"
