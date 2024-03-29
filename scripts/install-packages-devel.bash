#!/usr/bin/env bash

packages=(
	"make" "nodejs" "npm" "python-pip" "neofetch"
	"go" "delve"
	"neovim" "python-pynvim" "ctags"
	"ripgrep" "lf" "fzf"
	"glow" "tmux" "jq"
	"tealdeer" "vhs"
	"starship" "gum" "cloc" "gitui"
	# "strace" "net-tools" "base-devel"
	# "htop" "docker" "p7zip"

	# LSPs
	"bash-language-server" "clang" "gopls" "pyright" "lua-language-server"
	# Formatters
	"python-black" "prettier" "shfmt" "stylua" "taplo-cli"
	# Linters
	"shellcheck"
)

# yay_packages=(
# 	"volar-server-bin"
# 	"golangci-lint-bin"
# 	"prettierd"
# 	# "python-cmakelang"
# 	"gofumpt"
# )
# yay -S volar-server-bin golangci-lint-bin prettierd gofumpt

main() {
	for package in "${packages[@]}"; do
		pacman -Sy \
			--noconfirm \
			--noprogressbar \
			--needed \
			--disable-download-timeout \
			"$package"
	done

	# for package in "${yay_packages[@]}"; do
	# 	yay -Sy \
	# 		--noconfirm \
	# 		--noprogressbar \
	# 		--needed \
	# 		--disable-download-timeout \
	# 		"$package"
	# done

	# npm install -g @volar/vue-language-server
}

main "$@"
