#!/usr/bin/env bash

packages=(
	"yay"
	"strace" "net-tools"
	"base-devel" "nodejs" "npm" "go"
	"clash"
	"neofetch"
	"neovim" "nvim-packer-git" "python-pynvim" "ctags"
	"ripgrep" "lf" "fzf" "htop" "glow" "tmux"

	# LSPs
	"bash-language-server" "clang" "gopls" "pyright" "lua-language-server"
	# Formatters
	"python-black" "prettier" "prettierd" "shfmt" "stylua"
	# Linters
	"golangci-lint-bin" "shellcheck"
	"starship" "gum"
)

desktop_packages=(
	"xorg-server" "tk" "xclip" "pavucontrol" "xautolock" "xsecurelock"
	"lxappearance" "dunst" "network-manager-applet" "picom"
	"flameshot" "maim"
	"alacritty"
	"nemo" "nemo-fileroller"
	"baobab"
	"firefox" "mailspring" "nutstore"

	# Appearance
	"arc-gtk-theme" "bibata-cursor-theme"

	# Fonts
	"ttf-cascadia-code" "nerd-fonts-cascadia-code"
	"noto-fonts-emoji"
	"adobe-source-han-sans-cn-fonts" "wqy-microhei"

	# Text editor
	"xed"

	# Development
	"meld"

	# Communication
	"telegram-desktop"

	# Image viewer
	"feh" "nomacs" "xviewer"

	# Multimedia
	"mpv" "vlc"

	# Note-taking
	# "obsidian"
	# "notion-app-enhanced"
	"joplin-desktop"

	# Rofi
	"rofi"
)

yay_packages=(
	"sublime-text-4"
	"clash-for-windows-bin"
	"baidunetdisk-electron"
	"typora-free"
	"xunlei-bin"

	"python-cmakelang"
)

main() {
	for package in "${packages[@]}" "${desktop_packages[@]}"; do
		pacman -S \
			--noconfirm \
			--noprogressbar \
			--needed \
			--disable-download-timeout \
			"$package"
	done
}

main "$@"
