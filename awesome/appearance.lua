-- Standard awesome library
local gears = require("gears")
-- Theme handling library
local beautiful = require("beautiful")

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
-- beautiful.init(gears.filesystem.get_themes_dir() .. "gtk/theme.lua")
-- beautiful.init(gears.filesystem.get_themes_dir() .. "sky/theme.lua")
beautiful.init(gears.filesystem.get_themes_dir() .. "xresources/theme.lua")
-- beautiful.init(gears.filesystem.get_themes_dir() .. "zenburn/theme.lua")

beautiful.useless_gap = 5
beautiful.gap_single_client = true
