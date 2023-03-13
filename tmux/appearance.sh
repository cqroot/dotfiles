#!/usr/bin/env bash

# *********************************************************
# Options                                                 *
# *********************************************************
# tmux set-option -gq status-justify left
tmux set-option -gq status-justify centre

# *********************************************************
# Colors                                                  *
# *********************************************************
MAIN_COLOR=#BD93F9
FG_MAIN=#EAEAEA
FG_ALT=#282A2E
BG_MAIN=0

# *********************************************************
# Status options                                          *
# *********************************************************
tmux set-option -gq status-interval 1
tmux set-option -gq status on

# *********************************************************
# Basic status bar colors                                 *
# *********************************************************
tmux set-option -gq status-fg "$FG_MAIN"
tmux set-option -gq status-bg "$BG_MAIN"
tmux set-option -gq status-attr none

# *********************************************************
# Modules                                                 *
# *********************************************************
session_module="#[fg=$MAIN_COLOR,bg=$FG_ALT]\
#[fg=$FG_ALT,bg=$MAIN_COLOR,bold] #S "
prefix_module="#[fg=$FG_ALT,bg=$MAIN_COLOR]#{?client_prefix,~, }\
#[fg=$MAIN_COLOR,bg=$FG_ALT] "

tmux set-option -gq status-left "$session_module$prefix_module#[fg=$FG_MAIN,bg=$BG_MAIN] "
tmux set-option -gq status-right '               '

# *********************************************************
# Status left                                             *
# *********************************************************
tmux set-option -gq status-left-fg "$FG_MAIN"
tmux set-option -gq status-left-bg "$BG_MAIN"
tmux set-option -gq status-left-length 150

# *********************************************************
# Status right                                            *
# *********************************************************
tmux set-option -gq status-right-fg "$FG_MAIN"
tmux set-option -gq status-right-bg "$BG_MAIN"

# *********************************************************
# Window                                                  *
# *********************************************************
tmux set-option -gq window-status-format ' #I #W'
tmux set-option -gq window-status-current-format ' #I #W'

tmux set-option -gq window-status-format "#[fg=$FG_MAIN,bg=$BG_MAIN,bold] #I:#W#F "
tmux set-option -gq window-status-current-format "#[fg=#424242]#[fg=$FG_MAIN,bg=#424242,bold] #I:#W#F #[fg=#424242,bg=0]"

# *********************************************************
# Others                                                  *
# *********************************************************
tmux set-option -gq mode-style "bg=$MAIN_COLOR,fg=$BG_MAIN"
