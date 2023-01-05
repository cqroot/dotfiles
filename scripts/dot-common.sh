#!/bin/bash

script_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "$script_path/dot-configs.sh"

case "$(uname -s)" in
Linux*)
	configs=("${linux_configs[@]}")
	;;
Darwin*)
	configs=()
	;;
MINGW*)
	configs=("${windows_configs[@]}")
	;;
*)
	configs=()
	;;
esac

generate_pairs() {
	script_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
	dotfiles_path=$(dirname "$script_path")

	for line in "${configs[@]}"; do
		IFS=" " read -r -a config <<<"$line"

		target="${config[0]}"
		exec="${config[1]}"
		each="${config[2]}"
		type="${config[3]}"

		if [[ $exec != "-" ]]; then
			command -v "$exec" >/dev/null 2>&1 || continue
		fi

		src="$dotfiles_path/$target"
		dst=""

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
			echo "$src $dst"
		else
			for file in "$src"/*; do
				echo "$file $dst/$(basename "$file")"
			done
		fi
	done
}

confirm() {
	echo -n "Confirm to $1 [y/N] "
	read -r cfm
	echo

	if [[ $cfm != "y" && $cfm != "Y" ]]; then
		return 1
	fi
	return 0
}

check_dot() {
	case "$(uname -s)" in
	MINGW*)
		if ! diff "$1" "$2"; then
			return 1
		fi
		;;
	*)
		actual_src=$(readlink -f "$2")
		if [[ $actual_src != "$1" ]]; then
			return 1
		fi
		;;
	esac

	return 0
}
