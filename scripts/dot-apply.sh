#!/bin/bash

script_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "$script_path/dot-common.sh"

main() {
	result=$(generate_pairs)

	echo -e "$result" | column -t
	echo

	if ! confirm "Apply"; then
		return
	fi

	while read -r line; do
		if [[ -z "${line// /}" ]]; then
			continue
		fi

		IFS=" " read -r -a pair <<<"$line"
		src="${pair[0]}"
		dst="${pair[1]}"

		ln -s "$src" "$dst"
	done < <(echo -e "$result")
}

main
