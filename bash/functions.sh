#!/usr/bin/env bash

function kb_is_windows() {
	case "$(uname -s)" in
	CYGWIN* | MINGW* | MSYS*)
		return 0
		;;
	esac
	return 1
}
