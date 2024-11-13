#!/usr/bin/env bash

if ! command -v fzf >/dev/null; then
    return
fi

export FZF_DEFAULT_OPTS='--cycle --border=rounded --pointer=• --prompt="❯ "'

CURR_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${CURR_DIR}/fzf/key-bindings.bash"
source "${CURR_DIR}/fzf/completion.bash"
