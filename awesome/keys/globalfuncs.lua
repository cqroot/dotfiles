local M = {}

-- Standard awesome library
local awful = require("awful")

function M.client_focus_next()
	awful.client.focus.byidx(1)
end
function M.client_focus_prev()
	awful.client.focus.byidx(-1)
end

function M.client_swap_next()
	awful.client.swap.byidx(1)
end
function M.client_swap_prev()
	awful.client.swap.byidx(-1)
end

function M.screen_focus_next()
	awful.screen.focus_relative(1)
end
function M.screen_focus_prev()
	awful.screen.focus_relative(-1)
end

function M.system_volume_up()
	awful.spawn.with_shell("~/.bin/system/volume-ctl.sh up")
end
function M.system_volume_down()
	awful.spawn.with_shell("~/.bin/system/volume-ctl.sh down")
end
function M.system_volume_mute()
	awful.spawn.with_shell("~/.bin/system/volume-ctl.sh mute")
end

function M.app_terminal()
	awful.spawn("alacritty")
end
function M.app_launcher()
	awful.spawn("rofi -show drun -show-icons -no-history")
end
function M.app_power()
	awful.spawn.with_shell("~/.bin/system/power.sh")
end
function M.app_emoji_picker()
	awful.spawn("emoji-picker")
end

return M
