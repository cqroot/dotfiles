#!/usr/bin/env bash

packages=(
	"strace" "net-tools" "bash-completion"
	"base-devel" "nodejs" "npm" "go" "python-pip"
	"clash"
	"neofetch"
	"neovim" "nvim-packer-git" "python-pynvim" "ctags"
	"ripgrep" "lf" "fzf" "htop" "glow" "tmux" "jq"
	"bat" "gitui" "diff-so-fancy"
	"docker" "delve" "p7zip" "tealdeer" "vhs"
	"starship" "zoxide" "gum" "cloc"
	"exa"
	"zsh" "zsh-autosuggestions"

	# LSPs
	"bash-language-server" "clang" "gopls" "pyright" "lua-language-server"
	# Formatters
	"python-black" "prettier" "shfmt" "stylua" "taplo-cli" "eslint_d"
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
