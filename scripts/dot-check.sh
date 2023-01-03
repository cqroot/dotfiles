#!/bin/bash

script_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "$script_path/dot-common.sh"

main() {
	result=$(generate_pairs)

	echo -e "$result" | column -t
	echo

	echo "Dot to be applied:"
	while read -r line; do
		if [[ -z "${line// /}" ]]; then
			continue
		fi

		IFS=" " read -r -a pair <<<"$line"
		src="${pair[0]}"
		dst="${pair[1]}"

		actual_src=$(readlink -f "$dst")
		if [[ $actual_src != "$src" ]]; then
			echo "x: $src"
		fi
	done < <(echo -e "$result")

	echo
}

main
