#!/bin/bash

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' -o "${SCRIPT_PATH}/git-prompt.sh"
