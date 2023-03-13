#!/usr/bin/env bash

desktop_packages=(
	"xorg-server" "tk" "xclip" "pavucontrol" "xautolock" "xsecurelock"
	# "pulseaudio"
	"lxappearance" "dunst" "network-manager-applet"
	"flameshot" "maim"
	"alacritty"
	"nemo" "nemo-fileroller"
	"baobab"
	"firefox"
	"peek"
	"i3" "polybar"

	# Appearance
	"arc-gtk-theme"
	"papirus-icon-theme"

	# Fonts
	"ttf-cascadia-code"
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
	"obsidian"
	# "notion-app-enhanced"

	# Rofi
	"rofi"

	"fcitx-im"
	"gnome-keyring"
)
# "mailspring" "nutstore" "bibata-cursor-theme-bin" "nerd-fonts-cascadia-code"
# "joplin-desktop" "fctix-configtool"

yay_packages=(
	"clash-for-windows-bin"
	"baidunetdisk-electron"
	"xunlei-bin"
	"xviewer"
	"microsoft-edge-stable-bin"
	"wechat-uos"
	"qqmusic-bin"
	# "pulseaudio-ctl"
	"localsend-bin"
	"x11-emoji-picker"
	"fcitx-sogoupinyin"
	"picom-ftlabs-git"

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

	# for package in "${yay_packages[@]}"; do
	# 	yay -S \
	# 		--noconfirm \
	# 		--noprogressbar \
	# 		--needed \
	# 		--disable-download-timeout \
	# 		"$package"
	# done
}

main "$@"
