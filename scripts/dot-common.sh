#!/bin/bash

linux_configs=(
	# DOT                   EXEC            TYPE
	# Type can be the following values
	#     xdg:  Apply dot   to $home/.config/dot
	#     xdg_: Apply dot/* to $home/.config/dot/*
	#     home: Apply dot   to $home/.dot
	#     win:  Apply dot   to $APPDATA/dot
	"alacritty              alacritty       xdg"
	"bash                   bash            xdg"
	"bin                    -               home"
	"dunst                  dunst           xdg"
	"git/gitconfig          git             home"
	"go                     go              xdg"
	"i3                     i3              xdg"
	"joplin-desktop         joplin-desktop  xdg_"
	"lf                     lf              xdg"
	"mpv                    mpv             xdg"
	"picom                  picom           xdg"
	"polybar                polybar         xdg"
	"rofi                   rofi            xdg"
	"sqlite3/sqliterc       sqlite3         home"
	"starship/starship.toml starship        xdg"
	"tmux                   tmux            xdg"
)

windows_configs=(
	"alacritty              alacritty       win"
	"git/gitconfig          git             home"
	"go                     go              win"
	"joplin-desktop         -               xdg_"
)

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
		type="${config[2]}"

		if [[ $exec != "-" ]]; then
			command -v "$exec" >/dev/null 2>&1 || continue
		fi

		src="$dotfiles_path/$target"

		case $type in
		"xdg")
			dst="$HOME/.config/$(basename "$target")"
			echo "$src $dst"
			;;

		"xdg_")
			dst="$HOME/.config/$(basename "$target")"
			for file in "$src"/*; do
				echo "$file $dst/$(basename "$file")"
			done
			;;

		"home")
			dst="$HOME/.$(basename "$target")"
			echo "$src $dst"
			;;
		"win")
			dst="$APPDATA/$(basename "$target")"
			echo "$src $dst"
			;;
		esac
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
