#!/bin/bash

alias srcbash='source ~/.bashrc'
alias srczsh='source ~/.zshrc'
alias srctmux='tmux source-file ~/.config/tmux/tmux.conf'
alias proxyon='export all_proxy=http://192.168.56.1:7890'
alias proxyoff='unset all_proxy'

# ******************************************************************************
# * List                                                                       *
# ******************************************************************************
if command -v exa >/dev/null; then
	alias ls="exa --group-directories-first"
	alias ll="exa --group-directories-first --long --header --git --icons"
	alias la="ll --all"
	alias l.="exa --all | grep -E '^\.'"
	alias tree="ll --tree --level=4 -a -I=.git --git-ignore"
else
	alias ls='ls --color=auto'
	alias ll='ls -lh --group-directories-first'
	alias la='ls -lha --group-directories-first'
	alias l.="ls -A | grep -E '^\.'"
fi

# ******************************************************************************
# * Tmux                                                                       *
# ******************************************************************************
if command -v tmux >/dev/null; then
	alias tl='tmux ls'
	alias tn='tmux new -s $(basename $PWD)'
fi

# ******************************************************************************
# * Others                                                                     *
# ******************************************************************************
if command -v lf >/dev/null; then
	if [ -f /etc/profile.d/lfcd.sh ]; then
		source /etc/profile.d/lfcd.sh
		alias l='lfcd'
	fi
fi

if command -v nvim >/dev/null; then
	alias nvi=nvim
fi

if command -v gitui >/dev/null; then
	alias gu=gitui
fi

if command -v lazygit >/dev/null; then
	alias lg=lazygit
fi
