local color_palette = {
	background = "#282a36",
	current_line = "#44475a",
	foreground = "#f8f8f2",
	comment = "#6272a4",
	cyan = "#8be9fd",
	green = "#50fa7b",
	orange = "#ffb86c",
	pink = "#ff79c6",
	purple = "#bd93f9",
	red = "#ff5555",
	yellow = "#f1fa8c",
}

local theme = {
	fg_normal = color_palette.foreground,
	bg_normal = color_palette.background,
	fg_focus = color_palette.cyan,
	bg_focus = color_palette.background,
	fg_urgent = color_palette.background,
	bg_urgent = color_palette.red,
	bat_fg_critical = color_palette.red,
	border_normal = color_palette.background,
	border_focus = color_palette.purple,
	border_marked = color_palette.red,
	taglist_bg_urgent = color_palette.red,
	taglist_bg_focus = color_palette.comment,
	tasklist_fg_normal = color_palette.comment,
	tasklist_fg_focus = color_palette.yellow,
	icon_theme = "Papirus-Dark",
}

local M = {
	color_palette = color_palette,
	theme = theme,
}

return M
