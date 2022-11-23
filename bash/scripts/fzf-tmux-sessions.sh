#!/bin/bash

tmux_list_session() {
    tmux_session=$(
        tmux ls | awk -F':' '{print $1}' | fzf \
            --cycle \
            --height=10 \
            --preview="tmux ls -f '#{m:{},#{session_name}}'"
    )
    if [ ! -z $tmux_session ]; then
        tmux attach -t "$tmux_session"
    fi
}
