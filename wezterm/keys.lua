local wezterm = require("wezterm")
local act = wezterm.action

return {
	-- disable_default_key_bindings = true,
	leader = { mods = "ALT", key = "e" },

	keys = {
		-- Turn off the default CMD-m Hide action, allowing CMD-m to
		-- be potentially recognized and handled by the tab
		{ mods = "ALT", key = "Enter", action = act.DisableDefaultAssignment },

		-- Pane
		{ mods = "LEADER", key = "=", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ mods = "LEADER", key = "\\", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ mods = "LEADER", key = "h", action = act({ ActivatePaneDirection = "Left" }) },
		{ mods = "LEADER", key = "j", action = act({ ActivatePaneDirection = "Down" }) },
		{ mods = "LEADER", key = "k", action = act({ ActivatePaneDirection = "Up" }) },
		{ mods = "LEADER", key = "l", action = act({ ActivatePaneDirection = "Right" }) },
		{ mods = "LEADER|SHIFT", key = "H", action = act({ AdjustPaneSize = { "Left", 5 } }) },
		{ mods = "LEADER|SHIFT", key = "J", action = act({ AdjustPaneSize = { "Down", 5 } }) },
		{ mods = "LEADER|SHIFT", key = "K", action = act({ AdjustPaneSize = { "Up", 5 } }) },
		{ mods = "LEADER|SHIFT", key = "L", action = act({ AdjustPaneSize = { "Right", 5 } }) },

		-- Tab
		{ mods = "LEADER", key = "1", action = act({ ActivateTab = 0 }) },
		{ mods = "LEADER", key = "2", action = act({ ActivateTab = 1 }) },
		{ mods = "LEADER", key = "3", action = act({ ActivateTab = 2 }) },
		{ mods = "LEADER", key = "4", action = act({ ActivateTab = 3 }) },
		{ mods = "LEADER", key = "5", action = act({ ActivateTab = 4 }) },
		{ mods = "LEADER", key = "6", action = act({ ActivateTab = 5 }) },
		{ mods = "LEADER", key = "7", action = act({ ActivateTab = 6 }) },
		{ mods = "LEADER", key = "8", action = act({ ActivateTab = 7 }) },
		{ mods = "LEADER", key = "9", action = act({ ActivateTab = 8 }) },

		{ mods = "LEADER", key = "c", action = act.SpawnTab("CurrentPaneDomain") },
		{ mods = "LEADER", key = "w", action = act.ShowTabNavigator },
		{ mods = "LEADER", key = "x", action = act({ CloseCurrentPane = { confirm = true } }) },

		{ mods = "LEADER", key = "n", action = act.ActivateTabRelative(1) },
		{ mods = "LEADER", key = "p", action = act.ActivateTabRelative(-1) },
	},
}
