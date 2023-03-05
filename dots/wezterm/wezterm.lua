local wezterm = require("wezterm")

return {
	default_prog = { "C:/Program Files/Git/bin/bash.exe" },
	-- color_scheme = "Nord",
	color_scheme = "Dracula+",
	font = wezterm.font("CaskaydiaCove Nerd Font"),
	font_size = 14.0,
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action.Paste,
		},
	},
}
