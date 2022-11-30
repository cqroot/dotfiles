#!/usr/bin/env bash

packages=(
	"yay"
	"strace" "net-tools"
	"base-devel" "nodejs" "npm" "go"
	"clash"
	"neofetch"
	"neovim" "nvim-packer-git" "python-pynvim" "ctags"
	"ripgrep" "lf" "fzf" "htop" "glow" "tmux"
	"shfmt" "shellcheck" "python-black" "prettier"
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
	"obsidian"
	# "notion-app-enhanced"

	# Rofi
	"rofi"
)

yay_packages=(
	"sublime-text-4"
	"clash-for-windows-bin"
	"baidunetdisk-electron"
	"typora-free"
)

main() {
	# for package in "${packages[@]}" "${desktop_packages[@]}"; do
	#     pacman -S \
	#         --noconfirm \
	#         --noprogressbar \
	#         --needed \
	#         --disable-download-timeout \
	#         "$package"
	# done

	for package in "${yay_packages[@]}"; do
		yay -S \
			--noconfirm \
			--noprogressbar \
			--needed \
			--disable-download-timeout \
			"$package"
	done
}

main "$@"
