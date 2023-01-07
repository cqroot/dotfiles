#!/bin/bash

check_dot() {
	local src=$1
	local dst=$2
	local symlink=$3

	case "$symlink" in
	0)
		if ! diff "$1" "$2"; then
			return 1
		fi
		;;
	1)
		actual_src=$(readlink -f "$2")
		if [[ $actual_src != "$1" ]]; then
			return 1
		fi
		;;
	esac

	return 0
}

dot_status() {
	local src=$1
	local dst=$2
	local symlink=$3

	local green='\033[0;32m'
	local red='\033[0;33m'
	local nc='\033[0m'

	if check_dot "$src" "$dst" "$symlink"; then
		echo -e "$1" "$2" "${green}OK${nc}"
	else
		echo -e "$1" "$2" "${red}X${nc}"
	fi
}

dot_apply() {
	local src=$1
	local dst=$2
	local symlink=$3

	if ! check_dot "$src" "$dst" "$symlink"; then
		if [[ $symlink -eq 1 ]]; then
			echo ln -s "$src" "$dst"
			ln -s "$src" "$dst"
		else
			echo cp -rT "$src" "$dst"
			cp -rT "$src" "$dst"
		fi
	fi
}

dot_revoke() {
	local src=$1
	local dst=$2
	local symlink=$3

	if check_dot "$src" "$dst" "$symlink"; then
		if [[ $symlink -eq 1 ]]; then
			echo unlink "$dst"
		else
			echo rm -rf "$dst"
		fi
	fi
}

execute() {
	local src=$2
	local dst=$3
	local symlink=$4

	case "$1" in
	"apply")
		dot_apply "$src" "$dst" "$symlink"
		;;
	"revoke")
		dot_revoke "$src" "$dst" "$symlink"
		;;
	"status")
		dot_status "$src" "$dst" "$symlink"
		;;
	"")
		dot_status "$src" "$dst" "$symlink"
		;;
	esac
}

main() {
	local script_path
	script_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
	local dotfiles_path
	dotfiles_path=$(dirname "$script_path")

	source "$script_path/dot-configs.sh"
	case "$(uname -s)" in
	Linux*)
		local configs=("${linux_configs[@]}")
		;;
	Darwin*)
		local configs=()
		;;
	MINGW*)
		local configs=("${windows_configs[@]}")
		;;
	*)
		local configs=()
		;;
	esac

	for line in "${configs[@]}"; do
		IFS=" " read -r -a config <<<"$line"

		local target="${config[0]}"
		local exec="${config[1]}"
		local each="${config[2]}"
		local symlink="${config[3]}"
		local type="${config[4]}"

		if [[ $exec != "-" ]]; then
			command -v "$exec" >/dev/null 2>&1 || continue
		fi

		local src="$dotfiles_path/$target"
		local dst=""

		case $type in
		"xdg")
			dst="$HOME/.config/$(basename "$target")"
			;;

		"home")
			dst="$HOME/.$(basename "$target")"
			;;
		"win")
			dst="$APPDATA/$(basename "$target")"
			;;
		*)
			dst="$type"
			;;
		esac

		if [[ each -eq 0 ]]; then
			execute "$1" "$src" "$dst" "$symlink"
		else
			for file in "$src"/*; do
				execute "$1" "$file" "$dst/$(basename "$file")" "$symlink"
			done
		fi
	done
}

main "$1"
