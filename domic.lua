local goos = require("domic").goos()
local joinpath = require("domic").joinpath

local homedir = os.getenv("HOME")
local appdatadir = os.getenv("APPDATA")
local localappdatadir = os.getenv("LOCALAPPDATA")

local function dotconfigpath(dir)
	return joinpath({ homedir, ".config", dir })
end

local function appdatapath(dir)
	return joinpath({ appdatadir, dir })
end

local function localappdatapath(dir)
	return joinpath({ localappdatadir, dir })
end

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
			linux = dotconfigpath("alacritty"),
			windows = appdatapath("alacritty"),
		}),
		exec = "alacritty",
	},

	{
		name = "awesome",
		dst = linuxdata(dotconfigpath("awesome")),
		exec = "alacritty",
	},

	{
		name = "bash",
		src = "bash/bashrc",
		dst = joinpath({ homedir, ".bashrc" }),
		exec = "bash",
	},

	{
		name = "bin",
		dst = joinpath({ homedir, ".bin" }),
	},

	{
		name = "dunst",
		dst = linuxdata(dotconfigpath("dunst")),
		exec = "dunst",
	},

	{
		name = "fontconfig",
		dst = linuxdata(dotconfigpath("fontconfig")),
	},

	{
		name = "git",
		dst = dotconfigpath("git"),
		exec = "git",
	},

	{
		name = "gitui",
		dst = xplatdata({
			linux = dotconfigpath("gitui"),
			windows = appdatapath("gitui"),
		}),
		exec = "gitui",
	},

	{
		name = "go",
		dst = xplatdata({
			linux = dotconfigpath("go"),
			windows = appdatapath("go"),
		}),
		exec = "go",
	},

	{
		name = "joplin-desktop",
		dst = dotconfigpath("joplin-desktop"),
		exec = linuxdata("joplin-desktop"),
	},

	{
		name = "lf",
		dst = xplatdata({
			linux = dotconfigpath("lf"),
			windows = localappdatapath("lf"),
		}),
		exec = "lf",
	},

	{
		name = "mpv",
		dst = xplatdata({
			linux = dotconfigpath("mpv"),
			windows = appdatapath("mpv"),
		}),
		exec = "mpv",
	},

	{
		name = "nvim",
		dst = xplatdata({
			linux = dotconfigpath("nvim"),
			windows = localappdatapath("nvim"),
		}),
		exec = "nvim",
	},

	{
		name = "picom",
		dst = linuxdata(dotconfigpath("picom")),
		exec = "picom",
	},

	{
		name = "pip",
		src = "pip/pip.conf",
		dst = xplatdata({
			linux = dotconfigpath("pip/pip.conf"),
			windows = appdatapath("pip/pip.ini"),
		}),
		exec = "pip",
	},

	{
		name = "powershell",
		dst = xplatdata({
			windows = joinpath({ homedir, "Documents/PowerShell" }),
		}),
		exec = "pwsh",
	},

	{
		name = "rofi",
		dst = linuxdata(dotconfigpath("rofi")),
		exec = "rofi",
	},

	{
		name = "sqlite",
		src = "sqlite/sqliterc",
		dst = linuxdata(joinpath({ homedir, ".sqliterc" })),
		exec = "sqlite3",
	},

	{
		name = "tmux",
		dst = linuxdata(dotconfigpath("tmux")),
		exec = "tmux",
	},
}
