#!/usr/bin/env bash

if ! command -v bat >/dev/null; then
	return
fi

export PAGER='bat'
