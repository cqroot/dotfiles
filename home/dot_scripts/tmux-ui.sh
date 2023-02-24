#!/bin/bash

new="Create tmux session"
attach="Attach tmux session"
new_with_name="Create tmux session with the specified name"

get_option() {
	gum choose --cursor "◉ " \
		"$new" \
		"$attach" \
		"$new_with_name"
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
"$new_with_name")
	tmux new -s "$(gum input --placeholder "Session name")"
	;;
esac
