#!/usr/bin/env bash

git clone https://github.com/cqroot/dwm || return
cd dwm || return
make clean install
cd ..
