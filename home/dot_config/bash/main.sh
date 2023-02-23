#!/usr/bin/env bash

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# $HOME/.config -> /home/user/.config
shopt -u direxpand
# $HOME/.config -> \$HOME/.config
shopt -u progcomp

source "${SCRIPT_PATH}/envs.bash"
source "${SCRIPT_PATH}/aliases.bash"
source "${SCRIPT_PATH}/aliases_typo.bash"
source "${SCRIPT_PATH}/zoxide.bash"

# fzf
source "/usr/share/fzf/key-bindings.bash"
source "/usr/share/fzf/completion.bash"

# PS1='\[\033[01;32m\]➜ \[\033[01;37m\] \W\[\033[01;32m\]$(__git_ps1) »\[\033[00m\] '

eval "$(starship init bash)"
