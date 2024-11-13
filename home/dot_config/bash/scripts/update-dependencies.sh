#!/usr/bin/env bash

CURR_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ROOT_DIR=$(dirname "${CURR_DIR}")

GITHUB_RAW_URL=https://raw.githubusercontent.com

curl -fsSL "${GITHUB_RAW_URL}/junegunn/fzf/master/shell/completion.bash" -o "${ROOT_DIR}/modules/fzf/completion.bash"
curl -fsSL "${GITHUB_RAW_URL}/junegunn/fzf/master/shell/key-bindings.bash" -o "${ROOT_DIR}/modules/fzf/key-bindings.bash"
curl -fsSL "${GITHUB_RAW_URL}/git/git/master/contrib/completion/git-prompt.sh" -o "${ROOT_DIR}/modules/git/git-prompt.sh"
