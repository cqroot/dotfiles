#!/usr/bin/env bash

function main() {
	local script_dir && script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
	local root_dir && root_dir=$(dirname "${script_dir}")

	local img_path
	for img_path in "$script_dir"/*.png; do
		if ! grep -rn --include=*.md "$(basename "$img_path")" "$root_dir" >/dev/null; then
			echo "rm -rf '$img_path'"
		fi
	done
}

main
