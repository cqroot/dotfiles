# ******************************************************************************
# * Aliases                                                                    *
# ******************************************************************************
# list
alias ls='ls --color=auto'
alias ll='ls -lh --group-directories-first'
alias la='ls -lha --group-directories-first'
alias l.="ls -A | grep -E '^\.'"

if [ -f /etc/profile.d/lfcd.sh ]; then
	source /etc/profile.d/lfcd.sh
	alias l='lfcd'
fi

alias sourcebash='source ~/.bashrc'
alias sourcezsh='source ~/.zshrc'
alias proxyon='export all_proxy=http://192.168.0.3:7890'
alias proxyoff='unset all_proxy'

alias nvi=nvim
alias gu=gitui
alias tm='bash $HOME/.bin/scripts/tmux-ui.sh'
