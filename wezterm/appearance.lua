local wezterm = require("wezterm")

-- wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
-- 	local tabcount = ""
-- 	if #tabs > 1 then
-- 		tabcount = string.format("  <%d tabs>", #tabs)
-- 	end
--
-- 	return "Keith Chu" .. tabcount
-- end)

return {
	-- color_scheme = "wez",
	-- color_scheme = "zenbones_dark",
	-- color_scheme = "zenwritten_dark",
	color_scheme = "Dracula",
	-- color_scheme = "One Dark (Gogh)",

	font = wezterm.font("CaskaydiaCove Nerd Font"),
	font_size = 14.0,

	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	-- hide_tab_bar_if_only_one_tab = true,

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	window_decorations = "RESIZE",
}
