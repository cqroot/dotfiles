#!/usr/bin/env bash

KEITHBASH_DIR="${HOME}/.config/keithbash"

if grep "keithbash/main.sh" "$HOME/.bashrc" >/dev/null; then
	echo "KeithBash is already installed."
	exit 0
fi

echo "source \"${KEITHBASH_DIR}/main.sh\"" >>"$HOME/.bashrc"
