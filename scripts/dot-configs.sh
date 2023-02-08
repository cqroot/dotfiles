#!/bin/bash

firefox_base=$(ls -d "$HOME/.mozilla/firefox/"*.default-release/)
firefox_base=${firefox_base::-1}

# EXEC: If the command does not exist, it is not applied
# EACH: 0 or 1.
#     If not 0, apply one by one for all files in the source directory
# TYPE: Can be the following values
#     xdg:  Apply dot to $HOME/.config/dot
#     home: Apply dot to $HOME/.dot
#     win:  Apply dot to $APPDATA/dot
#
#   DOT                     EXEC            EACH? SYMLINK? TYPE
linux_configs=(
	"alacritty              alacritty       0     1        xdg"
	"bash                   bash            0     1        xdg"
	"bin                    -               0     1        home"
	"dunst                  dunst           0     1        xdg"
	"firefox                firefox         1     1        $firefox_base"
	"git/gitconfig          git             0     1        home"
	"gitui                  gitui           0     1        xdg"
	"go                     go              0     1        xdg"
	"i3                     i3              0     1        xdg"
	"joplin-desktop         joplin-desktop  1     1        xdg"
	"lf                     lf              0     1        xdg"
	"mpv                    mpv             0     1        xdg"
	"picom                  picom           0     1        xdg"
	"pip                    pip             0     1        xdg"
	"polybar                polybar         0     1        xdg"
	"rofi                   rofi            0     1        xdg"
	"sqlite3/sqliterc       sqlite3         0     1        home"
	"starship/starship.toml starship        0     1        xdg"
	"tmux                   tmux            0     1        xdg"
)

windows_configs=(
	"alacritty              alacritty       0     0         win"
	"git/gitconfig          git             0     0         home"
	"go                     go              0     0         win"
	"joplin-desktop         -               1     0         xdg"
)

export linux_configs
export windows_configs
