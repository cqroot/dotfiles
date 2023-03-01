#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# $HOME/.config -> /home/user/.config
shopt -u direxpand
# $HOME/.config -> \$HOME/.config
shopt -u progcomp

source "${SCRIPT_DIR}/envs.bash"
source "${SCRIPT_DIR}/aliases.bash"
source "${SCRIPT_DIR}/aliases_typo.bash"

PS1='\[\033[01;32m\]➜ \[\033[01;37m\] \W\[\033[01;32m\]$(__git_ps1) »\[\033[00m\] '

# source "${SCRIPT_DIR}/zoxide.bash"
# eval "$(starship init bash)"

# fzf
case $(uname -s) in
Linux*)
	source "/usr/share/fzf/key-bindings.bash"
	source "/usr/share/fzf/completion.bash"
	;;
Darwin*) ;;
CYGWIN*) ;;
MINGW*)
	source "${SCRIPT_DIR}/fzf/key-bindings.bash"
	source "${SCRIPT_DIR}/fzf/completion.bash"
	;;
*) ;;
esac
