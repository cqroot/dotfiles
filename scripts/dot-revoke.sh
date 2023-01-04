#!/bin/bash

script_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "$script_path/dot-common.sh"

main() {
	result=$(generate_pairs)

	while read -r line; do
		if [[ -z "${line// /}" ]]; then
			continue
		fi

		IFS=" " read -r -a pair <<<"$line"
		src="${pair[0]}"
		dst="${pair[1]}"

		echo rm -rf "$dst"
	done < <(echo "$result")

	echo
	echo "Please execute the delete command yourself."
}

main
