#!/bin/bash

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

alias ls='ls --color=auto'
alias ll='ls -lh --group-directories-first'
alias la='ls -lha --group-directories-first'
alias l.="ls -A | grep -E '^\.'"

alias ra='. ranger'

# aaa-aliases
alias aaabashsource='source ~/.bashrc'
# proxy
alias aaaproxyon='export all_proxy=http://127.0.0.1:7890'
alias aaaproxyoff='unset all_proxy'
alias aaaproxycheck='curl -s cip.cc; echo $all_proxy'

alias yay='env https_proxy=socks5://127.0.0.1:7890 yay'
alias gh='env https_proxy=socks5://127.0.0.1:7890 gh'

alias obinskit='sudo obinskit --no-sandbox'
alias pacman='sudo pacman'
alias systemctl='sudo systemctl'
alias docker='sudo docker'
alias netstat='sudo netstat'

if [ -f /etc/profile.d/lfcd.sh ]; then
	source /etc/profile.d/lfcd.sh
	alias l='lfcd'
fi

alias nvi=nvim

alias tn='ternote'
alias tncd='cd $(ternote path)'

alias gt='bash $HOME/.bin/gum-scripts/go-test-ui.sh'

# tmux
alias tmux='bash $HOME/.bin/gum-scripts/tmux-ui.sh'
