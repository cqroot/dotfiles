local domic = require("domic")
local goos = domic.goos()
local home_path = domic.home_path
local dot_config_path = domic.dot_config_path
local windows_app_data_path = domic.windows_app_data_path
local windows_local_app_data_path = domic.windows_local_app_data_path

local function linuxdata(data)
	if goos == "linux" then
		return data
	end
	return ""
end

local function xplatdata(data)
	if goos == "linux" then
		return data.linux
	elseif goos == "windows" then
		return data.windows
	end
	return ""
end

return {
	{
		name = "alacritty",
		dst = xplatdata({
			linux = dot_config_path("alacritty"),
			windows = windows_app_data_path("alacritty"),
		}),
		exec = "alacritty",
	},

	{
		name = "awesome",
		dst = linuxdata(dot_config_path("awesome")),
		exec = "alacritty",
	},

	{
		name = "bash",
		src = "bash/bashrc",
		dst = home_path(".bashrc"),
		exec = "bash",
	},

	{
		name = "bash_alias",
		src = "bash/bash_aliases",
		dst = home_path(".bash_aliases"),
		exec = "bash",
	},

	{
		name = "bin",
		dst = home_path(".bin"),
	},

	{
		name = "dunst",
		dst = linuxdata(dot_config_path("dunst")),
		exec = "dunst",
	},

	{
		name = "fontconfig",
		dst = linuxdata(dot_config_path("fontconfig")),
	},

	{
		name = "git",
		dst = dot_config_path("git"),
		exec = "git",
	},

	{
		name = "gitui",
		dst = xplatdata({
			linux = dot_config_path("gitui"),
			windows = windows_app_data_path("gitui"),
		}),
		exec = "gitui",
	},

	{
		name = "go",
		dst = xplatdata({
			linux = dot_config_path("go"),
			windows = windows_app_data_path("go"),
		}),
		exec = "go",
	},

	{
		name = "joplin-desktop",
		dst = dot_config_path("joplin-desktop"),
		exec = linuxdata("joplin-desktop"),
	},

	{
		name = "lf",
		dst = xplatdata({
			linux = dot_config_path("lf"),
			windows = windows_local_app_data_path("lf"),
		}),
		exec = "lf",
	},

	{
		name = "mpv",
		dst = xplatdata({
			linux = dot_config_path("mpv"),
			windows = windows_app_data_path("mpv"),
		}),
		exec = "mpv",
	},

	{
		name = "nvim",
		dst = xplatdata({
			linux = dot_config_path("nvim"),
			windows = windows_local_app_data_path("nvim"),
		}),
		exec = "nvim",
	},

	{
		name = "picom",
		dst = linuxdata(dot_config_path("picom")),
		exec = "picom",
	},

	{
		name = "pip",
		src = "pip/pip.conf",
		dst = xplatdata({
			linux = dot_config_path("pip/pip.conf"),
			windows = windows_app_data_path("pip/pip.ini"),
		}),
		exec = "pip",
	},

	{
		name = "powershell",
		dst = xplatdata({
			windows = home_path("Documents/PowerShell"),
		}),
		exec = "pwsh",
	},

	{
		name = "rofi",
		dst = linuxdata(dot_config_path("rofi")),
		exec = "rofi",
	},

	{
		name = "sqlite",
		src = "sqlite/sqliterc",
		dst = linuxdata(home_path(".sqliterc")),
		exec = "sqlite3",
	},

	{
		name = "starship",
		src = "starship/starship.toml",
		dst = dot_config_path("starship.toml"),
		exec = "starship",
	},

	{
		name = "tmux",
		dst = linuxdata(dot_config_path("tmux")),
		exec = "tmux",
	},

	{
		name = "x11",
		dst = linuxdata(home_path(".xprofile")),
		exec = "X",
	},
}
