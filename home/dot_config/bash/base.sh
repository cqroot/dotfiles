#!/usr/bin/env bash

# ******************************************************************************
# * Options                                                                    *
# ******************************************************************************
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -u direxpand      # $HOME/.config  - TAB   ->  /home/user/.config
shopt -u progcomp       # $HOME/.config  - TAB   ->  \$HOME/.config
shopt -u autocd         # DIR            - ENTER ->  cd -- dir/
shopt -u dotglob        # *                      ->  .*
shopt -u cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases

# autocomplete with one tab instead of two
bind "set show-all-if-ambiguous on"
# ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"
bind "set bell-style none"
# bind 'TAB:menu-complete'
# # pressing tab will automatically complete the first item
# bind '"\C-i" menu-complete'

export HISTCONTROL=ignoreboth:erasedups
