local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local TaskList = require("widget.task-list")
local TagList = require("widget.tag-list")
local catlist = require("widget.cat-list")
local gears = require("gears")
local clickable_container = require("widget.material.clickable-container")
local mat_icon_button = require("widget.material.icon-button")
local mat_icon = require("widget.material.icon")
local dpi = require("beautiful").xresources.apply_dpi
local icons = require("theme.icons")
local current_theme = require("theme.catppuccin")
-- local current_theme = require("theme.dracula")
-- local wifi_widget = require("widget.wifi")
-- local volume_slider = require("widget.volume.volume-slider")
local battery_widget = require("widget.awesome-wm-widgets.battery-widget.battery")
-- local brightness_widget = require("widget.awesome-wm-widgets.brightness-widget.brightness")

-- Titus - Horizontal Tray
local systray = wibox.widget.systray()
systray:set_horizontal(true)
systray:set_base_size(20)
systray.forced_height = 20

-- Clock / Calendar 24h format
-- local textclock = wibox.widget.textclock('<span font="Roboto Mono bold 9">%d.%m.%Y\n     %H:%M</span>')
-- Clock / Calendar 12AM/PM fornat
local textclock = wibox.widget.textclock('<span font="Roboto Mono 12">%a %d %I:%M %p</span>')
-- textclock.forced_height = 36

-- Add a calendar (credits to kylekewley for the original code)
local month_calendar = awful.widget.calendar_popup.month({
	screen = s,
	start_sunday = false,
	week_numbers = true,
})
month_calendar:attach(textclock)

local clock_widget = wibox.container.margin(textclock, dpi(13), dpi(13), dpi(9), dpi(8))

local add_button = mat_icon_button(mat_icon(icons.plus, dpi(24)))
add_button:buttons(gears.table.join(awful.button({}, 1, nil, function()
	awful.spawn(awful.screen.focused().selected_tag.defaultApp, {
		tag = _G.mouse.screen.selected_tag,
		placement = awful.placement.bottom_right,
	})
end)))

-- Create an imagebox widget which will contains an icon indicating which layout we're using.
-- We need one layoutbox per screen.
local LayoutBox = function(s)
	local layoutBox = clickable_container(awful.widget.layoutbox(s))
	layoutBox:buttons(awful.util.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	return layoutBox
end

local Panel = function(s)
	local panel_height = dpi(32)
	local panel = wibox({
		ontop = true,
		screen = s,
		height = dpi(32),
		width = s.geometry.width,
		x = s.geometry.x,
		y = s.geometry.y,
		-- y = s.geometry.y + s.geometry.height - panel_height,
		stretch = false,
		bg = current_theme.theme.bg_normal,
		fg = current_theme.theme.fg_normal,
		struts = {
			top = panel_height,
			-- bottom = panel_height,
		},
	})

	panel:struts({
		top = panel_height,
		-- bottom = panel_height,
	})

	panel:setup({
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			-- Create a taglist widget
			TagList(s),
			-- catlist(s),
			-- add_button,
		},
		wibox.container.place(TaskList(s)),
		{
			layout = wibox.layout.fixed.horizontal,
			-- wibox.container.margin(systray, dpi(3), dpi(3), dpi(6), dpi(3)),
			-- battery_widget,
			LayoutBox(s),
			awful.widget.keyboardlayout:new(),
			clock_widget,
		},
	})

	return panel
end

return Panel
