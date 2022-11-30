#!/usr/bin/env bash

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source "${SCRIPT_PATH}/envs.sh"
source "${SCRIPT_PATH}/aliases.sh"
source "${SCRIPT_PATH}/aliases_typo.sh"
source "${SCRIPT_PATH}/scripts/git-prompt.sh"

# fzf
source "/usr/share/fzf/key-bindings.bash"
source "/usr/share/fzf/completion.bash"

# PS1='\[\033[01;32m\]➜ \[\033[01;37m\] \W\[\033[01;32m\]$(__git_ps1) »\[\033[00m\] '

eval "$(starship init bash)"
