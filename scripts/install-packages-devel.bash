#!/usr/bin/env bash

packages=(
	"yay"
	"make" "nodejs" "npm" "python-pip" "neofetch"
	"go" "delve"
	"neovim" "python-pynvim" "ctags"
	"ripgrep" "lf" "fzf"
	"glow" "tmux" "jq"
	"tealdeer" "vhs"
	"starship" "gum" "cloc"
	# "strace" "net-tools" "base-devel"
	# "htop" "docker" "p7zip"

	# LSPs
	"bash-language-server" "clang" "gopls" "pyright" "lua-language-server"
	# Formatters
	"python-black" "prettier" "shfmt" "stylua" "taplo-cli"
	# Linters
	"shellcheck"
)

main() {
	for package in "${packages[@]}"; do
		pacman -S \
			--noconfirm \
			--noprogressbar \
			--needed \
			--disable-download-timeout \
			"$package"
	done

	npm install -g @volar/vue-language-server
}

main "$@"
