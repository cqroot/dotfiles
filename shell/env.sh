# ******************************************************************************
# * Envs                                                                       *
# ******************************************************************************
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='bat'
export HISTCONTROL=ignoreboth:erasedups

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
if [ -d "$HOME/.bin" ]; then
	PATH="$HOME/.bin:$PATH"
fi

# NPM
# export NODE_OPTIONS=--openssl-legacy-provider
