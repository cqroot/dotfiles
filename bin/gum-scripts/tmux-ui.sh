#!/bin/bash

new="Create tmux session"
attach="Attach tmux session"

get_option() {
	gum choose --cursor "◉ " \
		"$new" \
		"$attach"
}

attach_tmux_session() {
	session=$(
		gum choose --cursor "◉ " \
			$(tmux ls | awk -F':' '{print $1}')
	)

	tmux_args=(-u -2)
	tmux "${tmux_args[@]}" attach -t "${session}"
}

gum style \
	--border double \
	--border-foreground="#d285cf" \
	--margin 1 \
	--padding "0 1" \
	"Tmux UI"

case $(get_option) in
"$new")
	tmux new -s "$(basename "$PWD")"
	;;
"$attach")
	attach_tmux_session
	;;
esac
