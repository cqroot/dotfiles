local wezterm = require("wezterm")

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	local tabcount = ""
	if #tabs > 1 then
		tabcount = string.format("  <%d tabs>", #tabs)
	end

	return "Keith Chu" .. tabcount
end)

return {
	-- color_scheme = "Nord",
	color_scheme = "Dracula+",

	font = wezterm.font("CaskaydiaCove Nerd Font"),
	font_size = 14.0,

	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
}
