#!/bin/bash

FG_RED='\033[31m'
FG_GREEN='\033[32m'
FG_YELLOW='\033[33m'
FG_NC='\033[0m'

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

#######################################
# Check if the file is linked correctly.
# Arguments:
#   Linked file
#   The file linked to
# Returns:
#   0 if true, non-zero on error.
#######################################
check_link() {
    if [[ $(readlink "$2") -ef $1 ]]; then
        echo 0
    else
        echo 1
    fi

}

#######################################
# Link config to target.
# Arguments:
#   config to link
#   the target linked to
#######################################
link_config() {
    echo -ne "${FG_GREEN}$3${FG_NC}: $1 ${FG_GREEN}->${FG_NC} $2 : "

    if [[ "$(check_link "$1" "$2")" -eq 0 ]]; then
        echo -e "${FG_YELLOW} Linked${FG_NC}"
        return
    fi

    if ln -s "$1" "$2"; then
        echo -e "${FG_GREEN} OK${FG_NC}"
    else
        echo -e "${FG_RED} ERROR${FG_NC}"
    fi
}

#######################################
# Main.
#######################################
main() {
    mkdir -p "${HOME}/.config"

    # for item in $(ls "${SCRIPT_DIR}/dot/"); do
    for item in "${SCRIPT_DIR}"/dot/*; do
        f1=${item}
        name=$(echo "${item}" | sed 's/\/$//' | awk -F/ '{print $NF}')
        f2=${HOME}/.${name}

        link_config "${f1}" "${f2}" "${name}"
    done

    for item in "${SCRIPT_DIR}"/*/; do
        if [[ ${item} != ${SCRIPT_DIR}/dot/ ]]; then
            name=$(echo "${item}" | sed 's/\/$//' | awk -F/ '{print $NF}')

            f1=$(echo "$item" | sed 's/\/$//')
            f2=${HOME}/.config/${name}

            link_config "${f1}" "${f2}" "${name}"
        fi
    done
}

main "$@"
