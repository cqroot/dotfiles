alias ls='ls --color=auto'
alias ll='ls -lh --group-directories-first'
alias la='ls -lha --group-directories-first'
alias l.="ls -A | grep -E '^\.'"

alias nvi=nvim

alias ra='. ranger'

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

alias yay='env https_proxy=socks5://127.0.0.1:7890 yay'
alias gh='env https_proxy=socks5://127.0.0.1:7890 gh'

alias obinskit='sudo obinskit --no-sandbox'
alias pacman='sudo pacman'
alias systemctl='sudo systemctl'
alias netstat='sudo netstat'
