#!/bin/bash

while read -r line; do
	case "$line" in
	"=== RUN "*)
		echo
		gum style \
			--border normal \
			--padding "0 1" \
			--foreground 15 \
			--bold \
			"$line"
		;;
	"--- PASS"*)
		echo "${line/PASS/$(gum style \
			--foreground 10 \
			--bold \
			"PASS")}"
		;;
	"--- FAIL"*)
		echo "${line/FAIL/$(gum style \
			--foreground 9 \
			--bold \
			"FAIL")}"
		;;
	*)
		echo "$line"
		;;
	esac
done < <(go test -v ./...)
# done < <(go test "$@")
