#!/usr/bin/env bash

if ! command -v go >/dev/null; then
	return
fi

export GOPATH=$HOME/go
export PATH=${GOPATH}/bin:${PATH}
