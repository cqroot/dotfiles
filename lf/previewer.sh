#!/bin/bash

case "$(printf "%s\n" "$(readlink -f "$1")" | awk '{print tolower($0)}')" in
*.md)
	glow -s dark "$1"
	;;
*)
	bat --color=always --style=plain --pager=never "$1"
	;;
esac
exit 0
