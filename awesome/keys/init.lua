local M = {}

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local hotkeys_popup = require("awful.hotkeys_popup")
local globalfuncs = require("keys.globalfuncs")
local clientfuncs = require("keys.clientfuncs")

modkey = "Mod4"

-- {{{ Key bindings
M.globalkeys = gears.table.join(
	awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

	awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "e", awesome.quit, { description = "quit awesome", group = "awesome" }),

	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	-- awful.key({ modkey }, "j", globalfuncs.client_focus_next, { description = "focus next by index", group = "client" }),
	-- awful.key({ modkey }, "k", globalfuncs.client_focus_prev, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "a", globalfuncs.client_focus_next, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "d", globalfuncs.client_focus_prev, { description = "focus previous by index", group = "client" }),

	-- Layout manipulation
	-- awful.key({ modkey, "Shift" }, "j", globalfuncs.client_swap_next, { description = "swap with next client by index", group = "client" }),
	-- awful.key({ modkey, "Shift" }, "k", globalfuncs.client_swap_prev, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "a", globalfuncs.client_swap_next, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "d", globalfuncs.client_swap_prev, { description = "swap with previous client by index", group = "client" }),
	-- awful.key({ modkey, "Control" }, "j", globalfuncs.screen_focus_next, { description = "focus the next screen", group = "screen" }),
	-- awful.key({ modkey, "Control" }, "k", globalfuncs.screen_focus_prev, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "Tab", globalfuncs.screen_focus_next, { description = "focus the next screen", group = "screen" }),
	-- awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	-- awful.key({ modkey }, "Tab", function()
	-- 	awful.client.focus.history.previous()
	-- 	if client.focus then
	-- 		client.focus:raise()
	-- 	end
	-- end, { description = "go back", group = "client" }),

	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	-- awful.key({ modkey, "Shift" }, "space", function()
	-- 	awful.layout.inc(-1)
	-- end, { description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Standard program
	awful.key({ modkey }, "Return", globalfuncs.app_terminal, { description = "open a terminal", group = "launcher" }),
	awful.key({ "Mod1" }, "space", globalfuncs.app_launcher, { description = "rofi", group = "launcher" }),
	awful.key({ modkey }, "p", globalfuncs.app_power, { description = "power", group = "launcher" }),
	awful.key({ modkey }, ".", globalfuncs.app_emoji_picker, { description = "power", group = "launcher" }),

	-- Prompt
	awful.key({ modkey }, "r", function()
		awful.screen.focused().mypromptbox:run()
	end, { description = "run prompt", group = "launcher" }),

	-- System
	awful.key({}, "XF86AudioRaiseVolume", function()
		globalfuncs.system_volume_up()
	end),
	awful.key({}, "XF86AudioLowerVolume", function()
		globalfuncs.system_volume_down()
	end),
	awful.key({}, "XF86AudioMute", function()
		globalfuncs.system_volume_mute()
	end)
)

M.clientkeys = gears.table.join(
	awful.key({ modkey }, "f", clientfuncs.client_fullscreen, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey, "Shift" }, "q", clientfuncs.client_kill, { description = "close", group = "client" }),
	awful.key({ modkey, "Shift" }, "space", clientfuncs.client_toggle_floating, { description = "toggle floating", group = "client" }),

	awful.key({ modkey, "Control" }, "Return", clientfuncs.client_move_to_master, { description = "move to master", group = "client" }),
	awful.key({ modkey, "Shift" }, "Tab", clientfuncs.client_move_to_screen, { description = "move to screen", group = "client" }),
	awful.key({ modkey }, "t", clientfuncs.client_keep_on_top, { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey }, "n", clientfuncs.client_minimize, { description = "minimize", group = "client" }),
	awful.key({ modkey }, "m", clientfuncs.client_toggle_maximize, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Control" }, "m", clientfuncs.client_toggle_maximize_vertically, { description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", clientfuncs.client_toggle_maximize_horizontal, { description = "(un)maximize horizontally", group = "client" })
)

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	M.globalkeys = gears.table.join(
		M.globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
					tag:view_only()
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

-- Set keys
root.keys(M.globalkeys)
-- }}}

return M
