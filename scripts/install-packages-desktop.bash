#!/usr/bin/env bash

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
	"ttf-caladea" "ttf-carlito" "ttf-dejavu" "ttf-liberation" "ttf-linux-libertine-g" "noto-fonts" "adobe-source-code-pro-fonts" "adobe-source-sans-pro-fonts" "adobe-source-serif-pro-fonts"

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
	"localsend-bin"
	"x11-emoji-picker"

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
	for package in "${desktop_packages[@]}"; do
		pacman -S \
			--noconfirm \
			--noprogressbar \
			--needed \
			--disable-download-timeout \
			"$package"
	done

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
