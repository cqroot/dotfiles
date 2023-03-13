#!/usr/bin/env bash

yay_packages=(
	"mailspring" "nutstore" "bibata-cursor-theme-bin" "nerd-fonts-cascadia-code"
	"joplin-desktop" "fctix-configtool"

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
