#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/aliases.sh

# fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

PS1='\n\[\033[01;32m\]➜ \[\033[01;37m\] \W\[\033[01;32m\] »\[\033[00m\] '
