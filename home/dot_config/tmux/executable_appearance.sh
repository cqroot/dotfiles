#!/usr/bin/env bash

# *********************************************************
# Options                                                 *
# *********************************************************
SESSION_POS=left
# SESSION_POS=right

tmux set-option -gq status-justify left
# tmux set-option -gq status-justify centre

# *********************************************************
# Colors                                                  *
# *********************************************************
MAIN_COLOR=#BD93F9

FG_MAIN=#EAEAEA
BG_MAIN=#282A2E

FG_PREFIX=$BG_MAIN
BG_PREFIX=$MAIN_COLOR
FG_SESSION=$BG_MAIN
BG_SESSION=$MAIN_COLOR

FG_WINDOW=$FG_MAIN
BG_WINDOW=$BG_MAIN

FG_WINDOW_ACTIVE=$MAIN_COLOR
BG_WINDOW_ACTIVE=$BG_MAIN

# *********************************************************
# Status options ******************************************
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
# Modules *************************************************
# *********************************************************
session_module="#[fg=$FG_SESSION,bg=$BG_SESSION,bold]  #S "
prefix_module="#[fg=$FG_PREFIX,bg=$BG_PREFIX]#{?client_prefix,~, }"

if [ "$SESSION_POS" = "left" ]; then
    tmux set-option -gq status-left "$session_module$prefix_module#[fg=$FG_MAIN,bg=$BG_MAIN] "
    tmux set-option -gq status-right ''
else
    tmux set-option -gq status-left ''
    tmux set-option -gq status-right "$prefix_module $session_module"
fi

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

# tmux set-option -gq window-status-format "#[fg=$FG_WINDOW,bg=$BG_WINDOW,bold] ﱢ #I:#W#F "
# tmux set-option -gq window-status-current-format "#[fg=$FG_WINDOW_ACTIVE,bg=$BG_WINDOW_ACTIVE,bold] ﱢ #I:#W#F  "
tmux set-option -gq window-status-format "#[fg=$FG_WINDOW,bg=$BG_WINDOW,bold] #I:#W#F "
tmux set-option -gq window-status-current-format "#[fg=$FG_WINDOW_ACTIVE,bg=$BG_WINDOW_ACTIVE,bold] #I:#W#F  "

# *********************************************************
# Others                                                  *
# *********************************************************
tmux set-option -gq mode-style "bg=$MAIN_COLOR,fg=$BG_MAIN"
