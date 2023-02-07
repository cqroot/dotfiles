#!/usr/bin/env bash

packages=(
	"yay"
	"strace" "net-tools"
	"base-devel" "nodejs" "npm" "go"
	"clash"
	"neofetch"
	"neovim" "nvim-packer-git" "python-pynvim" "ctags"
	"ripgrep" "lf" "fzf" "htop" "glow" "tmux" "jq"
	"docker" "delve"

	# LSPs
	"bash-language-server" "clang" "gopls" "pyright" "lua-language-server"
	# Formatters
	"python-black" "prettier" "shfmt" "stylua" "taplo-cli"
	# Linters
	"shellcheck"
	"starship" "gum"
)

desktop_packages=(
	"xorg-server" "tk" "xclip" "pavucontrol" "xautolock" "xsecurelock"
	# "pulseaudio"
	"lxappearance" "dunst" "network-manager-applet" "picom"
	"flameshot" "maim"
	"alacritty"
	"nemo" "nemo-fileroller"
	"baobab"
	"firefox" "mailspring" "nutstore"
	"peek"

	# Appearance
	"arc-gtk-theme" "bibata-cursor-theme-bin"

	# Fonts
	"ttf-cascadia-code" "nerd-fonts-cascadia-code"
	"ttf-fira-code"
	"ttf-jetbrains-mono"
	"noto-fonts-emoji"
	"adobe-source-han-sans-cn-fonts" "wqy-microhei"

	# Text editor
	"xed"

	# Development
	"meld"

	# Communication
	"telegram-desktop"

	# Image viewer
	"feh" "nomacs"

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
	"clash-for-windows-bin"
	"baidunetdisk-electron"
	"xunlei-bin"
	"xviewer"
	"microsoft-edge-stable-bin"
	"listen1-electron"
	"wechat-uos"
	"qqmusic-bin"
	# "pulseaudio-ctl"

	# Editor ===================================================================
	"sublime-text-4"
	"visual-studio-code-bin"
	# "lite-xl-bin"
	# "typora-free"

	"golangci-lint-bin"
	"prettierd"
	# "python-cmakelang"
	"gofumpt"
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

	for package in "${packages[@]}" "${desktop_packages[@]}"; do
		yay -S \
			--noconfirm \
			--noprogressbar \
			--needed \
			--disable-download-timeout \
			"$package"
	done

	npm install -g @volar/vue-language-server
}

main "$@"
