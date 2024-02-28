require("awful.autofocus")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local modkey = require("configuration.keys.mod").modKey
local altkey = require("configuration.keys.mod").altKey
local apps = require("configuration.apps")

-- Key bindings
local globalKeys = awful.util.table.join(
	-- Hotkeys
	awful.key({ modkey }, "F1", hotkeys_popup.show_help, { description = "Show help", group = "awesome" }),

	-- Tag browsing
	awful.key({ modkey }, "[", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "]", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Tab", awful.tag.history.restore, { description = "go back", group = "tag" }),

	-- Default client focus
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "Focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "Focus previous by index", group = "client" }),

	-- Client Keys
	awful.key({ modkey }, "f", function(c)
		local c = _G.client.focus
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),

	awful.key(
		{ modkey, "Shift" },
		"f",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey, "Control" }, "Return", function(c)
		local c = _G.client.focus
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey }, "n", function(c)
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	awful.key({ modkey }, "o", function(c)
		awful.screen.focus_relative(1)
	end, { description = "Move to other screen", group = "client" }),
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey }, "m", function()
		local c = _G.client.focus
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Control" }, "m", function(c)
		local c = _G.client.focus
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", function(c)
		local c = _G.client.focus
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" }),
	awful.key({ altkey }, "space", function()
		awful.spawn(apps.default.app_launcher)
	end, { description = "Main menu", group = "awesome" }),
	awful.key({ modkey }, "F12", function()
		awful.spawn(apps.default.passmenu)
	end, { description = "Password Menu", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", function()
		_G.exit_screen_show()
	end, { description = "Log Out Screen", group = "awesome" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ altkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Switch to next window", group = "client" }),

	-- Programms
	awful.key({ modkey, "Shift" }, "p", function()
		awful.spawn(apps.default.lock)
	end, { description = "Lock the screen", group = "awesome" }),
	awful.key({}, "Print", function()
		awful.util.spawn_with_shell(apps.default.region_screenshot)
	end, {
		description = "Mark an area and screenshot it 10 seconds later (clipboard)",
		group = "screenshots (clipboard)",
	}),
	awful.key({ altkey, "Control" }, "p", function()
		awful.util.spawn_with_shell(apps.default.screenshot)
	end, {
		description = "Take a screenshot of your active monitor and copy it to clipboard",
		group = "screenshots (clipboard)",
	}),
	awful.key({ altkey, "Shift" }, "p", function()
		awful.util.spawn_with_shell(apps.default.region_screenshot)
	end, { description = "Mark an area and screenshot it to your clipboard", group = "screenshots (clipboard)" }),
	awful.key({ modkey }, "b", function()
		awful.util.spawn(apps.default.browser)
	end, { description = "Open a browser", group = "launcher" }),
	awful.key({ modkey }, "F9", function()
		awful.util.spawn(apps.default.process_terminator)
	end, { description = "Terminate process", group = "launcher" }),
	awful.key({ modkey }, "Escape", function()
		awful.util.spawn(apps.default.session_terminator)
	end, { description = "Terminate awesome session", group = "launcher" }),

	-- Standard program
	awful.key({ modkey }, "Return", function()
		awful.spawn(apps.default.terminal)
	end, { description = "Open a terminal", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "e", function()
		awful.spawn(apps.default.email)
	end, { description = "Open Email Client", group = "launcher" }),

	-- Window manipulations
	awful.key({ modkey, "Control" }, "r", _G.awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "Increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "Decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.client.incwfact(0.05)
	end, { description = "Decrease master height factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.client.incwfact(-0.05)
	end, { description = "Increase master height factor", group = "layout" }),
	awful.key({ altkey }, "l", function()
		awful.layout.inc(1)
	end, { description = "Select next", group = "layout" }),
	awful.key({ altkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "Select previous", group = "layout" }),
	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			_G.client.focus = c
			c:raise()
		end
	end, { description = "restore minimized", group = "client" }),
	awful.key({ modkey, "Shift" }, "c", function(c)
		_G.client.focus:kill()
	end, { description = "close", group = "client" }),
	awful.key({ modkey, "Control" }, "Down", function()
		awful.spawn(apps.default.emoji_selector)
	end, { description = "show rofi emoji selector", group = "launcher" }),
	-- Dropdown application
	awful.key({}, "F12", function()
		_G.toggle_quake()
	end, { description = "dropdown application", group = "launcher" }),

	-- Brightness
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn(apps.brightnesscontrol.brighter)
	end, { description = "+10%", group = "hotkeys" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn(apps.brightnesscontrol.darker)
	end, { description = "-10%", group = "hotkeys" }),

	-- ALSA volume control
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn(apps.audiocontrol.raise_volume)
	end, { description = "volume up", group = "hotkeys" }),
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn(apps.audiocontrol.lower_volume)
	end, { description = "volume down", group = "hotkeys" }),
	awful.key({}, "XF86AudioMute", function()
		awful.spawn(apps.audiocontrol.mute_audio)
	end, { description = "toggle mute", group = "hotkeys" }),
	awful.key({}, "XF86AudioPlay", function()
		awful.util.spawn(apps.audiocontrol.play_audio, false)
	end),
	awful.key({}, "XF86AudioNext", function()
		awful.util.spawn(apps.audiocontrol.next_track, false)
	end),
	awful.key({}, "XF86AudioPrev", function()
		awful.util.spawn(apps.audiocontrol.previous_track, false)
	end),
	awful.key({}, "XF86AudioStop", function()
		awful.util.spawn(apps.audiocontrol.stop_audio, false)
	end),
	awful.key({}, "XF86PowerDown", function()
		--
	end, { description = "toggle mute", group = "hotkeys" }),
	awful.key({}, "XF86PowerOff", function()
		_G.exit_screen_show()
	end, { description = "toggle mute", group = "hotkeys" }),

	-- Screen management
	awful.key(
		{ modkey, "Shift" },
		"o",
		awful.client.movetoscreen,
		{ description = "move window to next screen", group = "client" }
	),

	-- Open default program for tag
	awful.key({ modkey }, "t", function()
		awful.spawn(awful.screen.focused().selected_tag.defaultApp, {
			tag = _G.mouse.screen.selected_tag,
			placement = awful.placement.bottom_right,
		})
	end, { description = "Open default program for tag/workspace", group = "tag" }),
	-- Custom hotkeys
	-- File Manager
	awful.key({ modkey }, "e", function()
		awful.util.spawn(apps.default.files)
	end, { description = "filebrowser", group = "hotkeys" }),

	-- Project Launcher
	awful.key({ modkey }, "p", function()
		awful.util.spawn(apps.default.project_launcher)
	end, { description = "Project launcher", group = "hotkeys" }),

	-- Config Launcher
	awful.key({ modkey }, "c", function()
		awful.util.spawn(apps.default.config_launcher)
	end, { description = "Config launcher", group = "hotkeys" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	-- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 9 then
		descr_view = { description = "view tag #", group = "tag" }
		descr_toggle = { description = "toggle tag #", group = "tag" }
		descr_move = { description = "move focused client to tag #", group = "tag" }
		descr_toggle_focus = { description = "toggle focused client on tag #", group = "tag" }
	end
	globalKeys = awful.util.table.join(
		globalKeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, descr_view),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, descr_toggle),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if _G.client.focus then
				local tag = _G.client.focus.screen.tags[i]
				if tag then
					_G.client.focus:move_to_tag(tag)
				end
			end
		end, descr_move),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if _G.client.focus then
				local tag = _G.client.focus.screen.tags[i]
				if tag then
					_G.client.focus:toggle_tag(tag)
				end
			end
		end, descr_toggle_focus)
	)
end

return globalKeys
