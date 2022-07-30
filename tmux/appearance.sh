#!/usr/bin/env bash

# *********************************************************
# Color ***************************************************
# *********************************************************

# main
fg_main=#282A2E
bg_main=default

# window
fg_window=$fg_main
bg_window=$bg_main

# window active
fg_window_active=#EAEAEA
bg_window_active=$fg_main

# session
fg_session=$fg_main
bg_session=$bg_main

# *********************************************************
# Status options ******************************************
# *********************************************************
tmux set-option -gq status-interval 1
tmux set-option -gq status on

# *********************************************************
# Basic status bar colors *********************************
# *********************************************************
tmux set-option -gq status-fg "$fg_main"
tmux set-option -gq status-bg "$bg_main"
tmux set-option -gq status-attr none

# *********************************************************
# Modules *************************************************
# *********************************************************
session_module="#[fg=$fg_session,bg=$bg_session]  #S "
prefix_module="#{?client_prefix,~, }"

# *********************************************************
# Status left *********************************************
# *********************************************************
tmux set-option -gq status-left-fg "$fg_main"
tmux set-option -gq status-left-bg "$bg_main"

tmux set-option -gq status-left ''

# *********************************************************
# Status right ********************************************
# *********************************************************
tmux set-option -gq status-right-fg "$fg_main"
tmux set-option -gq status-right-bg "$bg_main"
tmux set-option -gq status-right "$prefix_module $session_module"

# *********************************************************
# Window **************************************************
# *********************************************************
tmux set-option -gq status-justify left

tmux set-option -gq window-status-format ' #I #W'
tmux set-option -gq window-status-current-format ' #I #W'

tmux set-option -gq window-status-format "#[fg=$fg_window,bg=$bg_window,bold] #I:#W#F "
tmux set-option -gq window-status-current-format "#[fg=$fg_window_active,bg=$bg_window_active,bold]    #I:#W#F  "

# Window separator
tmux set-option -gq window-status-separator ""
