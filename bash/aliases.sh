#!/usr/bin/env bash

alias bash_source='source ~/.bashrc'

alias ll='ls -l --group-directories-first'
alias nvi=nvim

# tmux
alias tmux='tmux -u -2'
alias tn='tmux new -s $(basename $PWD)'
alias ta='tmux attach -t'
alias tl=$'tmux ls | awk \'{$1=substr($1, 1, length($1)-1); $1=sprintf("\033[1;32m%-20s\033[00m", $1); print $0}\''

# proxy
alias proxy_on='export all_proxy=http://127.0.0.1:7890'
alias proxy_off='unset all_proxy'
alias proxy_check='curl -s cip.cc'
