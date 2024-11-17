#!/usr/bin/env bash

if ! command -v git >/dev/null; then
	return
fi

CURR_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${CURR_DIR}/git/git-prompt.sh"

alias gs='git status'
alias gsa='git status --untracked-files'
alias ga='git add'
alias gc='git commit'
alias gb='git branch -vv'
alias gr='git remote -v'

# alias gl="git -c 'pager.log=true' -c 'core.pager=less' log --decorate --graph --oneline"
alias gll="git log --pretty=format:'%C(yellow)%h %Cgreen%ad %Creset%s' --date=short"
alias gl='gll -n 20'
alias gllm='gll --merges'
alias glm='gl --merges'

alias gd='git diff'
alias gdc='git diff --cached'
