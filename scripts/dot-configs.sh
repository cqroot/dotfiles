#!/bin/bash

firefox_base=$(ls -d "$HOME/.mozilla/firefox/"*.default-release/)
firefox_base=${firefox_base::-1}

linux_configs=(
	# DOT                   EXEC            EACH?  TYPE
	#
	# EXEC: If the command does not exist, it is not applied
	# EACH: 0 or 1.
	#     If not 0, apply one by one for all files in the source directory
	# TYPE: Can be the following values
	#     xdg:  Apply dot to $HOME/.config/dot
	#     home: Apply dot to $HOME/.dot
	#     win:  Apply dot to $APPDATA/dot
	"alacritty              alacritty       0      xdg"
	"bash                   bash            0      xdg"
	"bin                    -               0      home"
	"dunst                  dunst           0      xdg"
	"firefox                firefox         1      $firefox_base"
	"git/gitconfig          git             0      home"
	"go                     go              0      xdg"
	"i3                     i3              0      xdg"
	"joplin-desktop         joplin-desktop  1      xdg"
	"lf                     lf              0      xdg"
	"mpv                    mpv             0      xdg"
	"picom                  picom           0      xdg"
	"polybar                polybar         0      xdg"
	"rofi                   rofi            0      xdg"
	"sqlite3/sqliterc       sqlite3         0      home"
	"starship/starship.toml starship        0      xdg"
	"tmux                   tmux            0      xdg"
)

windows_configs=(
	"alacritty              alacritty       0      win"
	"git/gitconfig          git             0      home"
	"go                     go              0      win"
	"joplin-desktop         -               1      xdg"
)

export linux_configs
export windows_configs
