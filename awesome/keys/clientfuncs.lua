local M = {}

local awful = require("awful")

function M.client_fullscreen(c)
	c.fullscreen = not c.fullscreen
	c:raise()
end

function M.client_kill(c)
	c:kill()
end

function M.client_toggle_floating(c)
	awful.client.floating.toggle(c)
end

function M.client_move_to_master(c)
	c:swap(awful.client.getmaster())
end

function M.client_move_to_screen(c)
	c:move_to_screen()
end

function M.client_keep_on_top(c)
	c.ontop = not c.ontop
end

function M.client_minimize(c)
	-- The client currently has the input focus, so it cannot be
	-- minimized, since minimized clients can't have the focus.
	c.minimized = true
end

function M.client_toggle_maximize(c)
	c.maximized = not c.maximized
	c:raise()
end

function M.client_toggle_maximize_vertically(c)
	c.maximized_vertical = not c.maximized_vertical
	c:raise()
end

function M.client_toggle_maximize_horizontal(c)
	c.maximized_horizontal = not c.maximized_horizontal
	c:raise()
end

return M
