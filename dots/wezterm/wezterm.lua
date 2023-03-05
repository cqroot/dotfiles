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

	-- disable_default_key_bindings = true,
	keys = {
		-- Turn off the default CMD-m Hide action, allowing CMD-m to
		-- be potentially recognized and handled by the tab
		{
			key = "Enter",
			mods = "ALT",
			action = wezterm.action.DisableDefaultAssignment,
		},
	},
}
