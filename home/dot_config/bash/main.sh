# If not running interactively, don't do anything
[ -z "$PS1" ] && return

KEITHBASH_DIR="${HOME}/.config/keithbash"
source "${KEITHBASH_DIR}/functions.sh"

# ******************************************************************************
# * Envs                                                                       *
# ******************************************************************************
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# ******************************************************************************

if [ -f "/usr/share/bash-completion/bash_completion" ]; then
    source "/usr/share/bash-completion/bash_completion"
fi

export PATH=${KEITHBASH_DIR}/bin:${PATH}

if [ -d "${HOME}/.bin" ]; then
    PATH="${HOME}/.bin:${PATH}"
fi

if [ -d "${HOME}/.local/bin" ]; then
    PATH="${HOME}/.local/bin:${PATH}"
fi

if command -v cargo >/dev/null; then
    # for cargo
    export PATH=${HOME}/.cargo/bin:${PATH}
fi

# NPM
# export NODE_OPTIONS=--openssl-legacy-provider

source "${KEITHBASH_DIR}/aliases/aliases.sh"

for module in "${KEITHBASH_DIR}"/modules/*.sh; do
    source "${module}"
done

export DELTA_PAGER="less ${LESS}"

PS1='\[\033[01;32m\]➜ \[\033[01;37m\] \W\[\033[01;32m\]$(__git_ps1) »\[\033[00m\] '

source "${KEITHBASH_DIR}/base.sh"
