#!/bin/bash

export EDITOR='nvim'
# export VISUAL='nano'
# export HISTCONTROL=ignoreboth:erasedups
export PAGER='bat'

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# NPM
export NODE_OPTIONS=--openssl-legacy-provider
