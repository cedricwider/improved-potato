local filesystem = require("gears.filesystem")
local mat_colors = require("theme.mat-colors")
local theme_dir = filesystem.get_configuration_dir() .. "/theme"
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi
local theme = {}
theme.icons = theme_dir .. "/icons/"
theme.font = "Roboto medium 10"
local current_theme = require("theme.catppuccin").theme
-- local current_theme = require("theme.dracula").theme

-- Colors Pallets

-- Primary
theme.primary = mat_colors.deep_orange

-- Accent
theme.accent = mat_colors.pink

-- Background
theme.background = mat_colors.grey

local awesome_overrides = function(theme)
	theme.dir = os.getenv("HOME") .. "/.config/awesome/theme"
	theme.icons = theme.dir .. "/icons/"
	--theme.wallpaper = theme.dir .. '/wallpapers/DarkCyan.png'
	theme.wallpaper = "#e0e0e0"
	theme.font = "Roboto medium 10"
	theme.title_font = "Roboto medium 14"

	theme.fg_normal = current_theme.fg_normal

	theme.fg_focus = current_theme.fg_focus
	theme.fg_urgent = current_theme.fg_urgent
	theme.bat_fg_critical = current_theme.bat_fg_critical

	theme.bg_normal = current_theme.bg_normal
	theme.bg_focus = current_theme.bg_focus
	theme.bg_urgent = current_theme.bg_urgent
	theme.bg_systray = current_theme.bg_normal

	-- Borders

	theme.border_width = dpi(2)
	theme.border_normal = current_theme.border_normal
	theme.border_focus = current_theme.border_focus
	theme.border_marked = current_theme.border_marked

	-- Menu

	theme.menu_height = dpi(16)
	theme.menu_width = dpi(160)

	-- Tooltips
	theme.tooltip_bg = current_theme.bg_normal
	theme.tooltip_border_width = 0
	theme.tooltip_shape = function(cr, w, h)
		gears.shape.rounded_rect(cr, w, h, dpi(6))
	end

	-- Layout

	theme.layout_max = theme.icons .. "layouts/arrow-expand-all.png"
	theme.layout_tile = theme.icons .. "layouts/view-quilt.png"

	-- Taglist

	theme.taglist_bg_empty = current_theme.bg_normal
	theme.taglist_bg_occupied = current_theme.bg_normal
	theme.taglist_bg_urgent = "linear:0,0:"
		.. dpi(40)
		.. ",0:0,"
		.. current_theme.taglist_bg_urgent
		.. ":0.08,"
		.. current_theme.taglist_bg_urgent
		.. ":0.08,"
		.. current_theme.bg_normal
		.. ":1,"
		.. current_theme.bg_normal
	theme.taglist_bg_focus = "linear:0,0:"
		.. dpi(40)
		.. ",0:0,"
		.. current_theme.taglist_bg_focus
		.. ":0.08,"
		.. current_theme.taglist_bg_focus
		.. ":0.08,"
		.. current_theme.bg_normal
		.. ":1,"
		.. current_theme.bg_normal
	theme.taglist_fg_focus = current_theme.taglist_fg_focus
	theme.taglist_fg_urgent = current_theme.taglist_fg_urgent
	theme.taglist_fg_empty = current_theme.taglist_fg_empty
	theme.taglist_bg_empty = current_theme.taglist_bg_empty
	theme.taglist_fg_occupied = current_theme.taglist_fg_occupied
	theme.taglist_bg_occupied = current_theme.taglist_bg_occupied
	theme.taglist_fg_empty = current_theme.taglist_fg_empty
	theme.taglist_bg_empty = current_theme.taglist_bg_empty

	-- Tasklist

	theme.tasklist_font = "Roboto medium 11"
	theme.tasklist_bg_normal = current_theme.bg_normal
	theme.tasklist_bg_focus = "linear:0,0:0,"
		.. dpi(40)
		.. ":0,"
		.. current_theme.bg_normal
		.. ":0.95,"
		.. current_theme.bg_normal
		.. ":0.95,"
		.. current_theme.fg_normal
		.. ":1,"
		.. current_theme.fg_normal
	theme.tasklist_fg_normal = current_theme.tasklist_fg_normal
	theme.tasklist_fg_focus = current_theme.tasklist_fg_focus
	theme.tasklist_fg_urgent = theme.fg_normal
	theme.tasklist_bg_urgent = current_theme.bg_urgent

	theme.icon_theme = current_theme.icon_theme

	--Client
	theme.border_width = dpi(2)
	theme.border_focus = current_theme.border_focus
	theme.border_normal = current_theme.border_normal
end

return {
	theme = theme,
	awesome_overrides = awesome_overrides,
}
