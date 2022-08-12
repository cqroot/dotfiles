#!/usr/bin/env bash

alias ll='ls -l --group-directories-first'
alias la='ls -la --group-directories-first'
alias nvi=nvim
alias yay='proxy=socks5://127.0.0.1:7890 yay'

alias ra=ranger

# tmux
alias tmux='tmux -u -2'
alias tn='tmux new -s $(basename $PWD)'
alias ta='tmux attach -t'
alias tl=$'tmux ls | awk \'{$1=substr($1, 1, length($1)-1); $1=sprintf("\033[1;32m%-20s\033[00m", $1); print $0}\''

# aaa-aliases
alias aaabashsource='source ~/.bashrc'
# proxy
alias aaaproxyon='export all_proxy=http://127.0.0.1:7890'
alias aaaproxyoff='unset all_proxy'
alias aaaproxycheck='curl -s cip.cc; echo $all_proxy'

alias obinskit='sudo obinskit --no-sandbox'
