local wezterm = require("wezterm")

local configs = {}

local append_configs = function(module)
	local subconfigs = require(module)
	for k, v in pairs(subconfigs) do
		configs[k] = v
	end
end

append_configs("appearance")
append_configs("keys")

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	configs.default_prog = { "C:/Program Files/Git/bin/bash.exe" }
	-- configs.launch_menu = {
	-- 	{
	-- 		label = "PowerShell",
	-- 		args = { "pwsh" },
	-- 	},
	-- }
end

if wezterm.target_triple == "x86_64-apple-darwin" then
end

if wezterm.target_triple == "x86_65-unknown-linux-gnu" then
end

return configs
