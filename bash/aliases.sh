#!/usr/bin/env bash

alias ll='ls -l --group-directories-first'
alias nvi=nvim

# tmux
alias tn='tmux -u -2 new -s $(basename $PWD)'
alias ta='tmux -u -2 attach -t'
alias tl='tmux -u -2 ls'
