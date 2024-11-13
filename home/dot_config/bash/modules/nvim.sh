#!/usr/bin/env bash

if ! command -v nvim >/dev/null; then
	return
fi

export EDITOR='nvim'
export VISUAL='nvim'
