#!/usr/bin/env bash

if ! command -v rg >/dev/null; then
	return
fi

if kb_is_windows; then
	alias rg="rg --path-separator '//'"
fi
