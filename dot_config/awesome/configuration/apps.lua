local terminal_command = "/home/cedricwider/scripts/launch_terminal.fish"
local rofi_command = "env /usr/bin/rofi -show run -matching fuzzy"
local pass_command = "/home/cedricwider/scripts/password-chooser.sh"

return {
	-- List of apps to start by default on some actions
	default = {
		app_launcher = rofi_command,
		browser = "brave",
		calendar = "/var/lib/snapd/snap/bin/morgen",
		config_launcher = "/home/cedricwider/.config/awesome/scripts/rofi-config-browser.fish",
		delayed_screenshot = "flameshot screen -p ~/Pictures/Screenshots -d 5000",
		editor = "nvim", -- gui text editor
		email = '/usr/bin/mailspring --password-store="gnome-libsecret"',
		emoji_selector = "rofi -show emoji -modi emoji -font 'Hack Nerd Font Mono 20'",
		files = "/home/cedricwider/.config/awesome/scripts/rofi-file-browser.sh",
		game = rofi_command,
		lock = "/home/cedricwider/scripts/lock.sh",
		music = "/usr/bin/spotify",
		passmenu = pass_command,
		process_terminator = "/home/cedricwider/scripts/rofi_xkill",
		project_launcher = "/home/cedricwider/.config/awesome/scripts/rofi-project-browser.fish",
		quake = "/usr/bin/kitty",
		region_screenshot = "flameshot gui",
		screenshot = "flameshot screen -p ~/Pictures/Screenshots",
		session_terminator = "/home/cedricwider/scripts/shutdown_menu",
		slack = "/usr/bin/slack",
		terminal = terminal_command,
	},

	audiocontrol = {
		raise_volume = "amixer -D pulse sset Master 5%+",
		lower_volume = "amixer -D pulse sset Master 5%-",
		mute_audio = "amixer -D pulse set Master 1+ toggle",
		play_audio = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause",
		next_track = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next",
		previous_track = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous",
		stop_audio = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop",
	},

	brightnesscontrol = {
		brighter = "light -A 5",
		darker = "light -U 5",
	},

	-- List of apps to start once on start-up
	run_on_start_up = {
		"flameshot",
		"nitrogen --set-zoom-fill --random ~/Pictures/wallpapers/minimalistic/images/",
		"nm-applet",
		"pcloud",
		"picom --config ~/.config/awesome/configuration/picom.conf",
		"pnmixer", -- shows an audiocontrol applet in systray when installed.
		'setxkbmap -layout us,ch -option "grp:win_space_toggle"',
		"unclutter",
		"xflux -l 47.4405761 -g 8.4410188",
		"xscreensaver -no-splash",
		"udiskie -sF",
		"~/.config/awesome/configuration/awspawn", -- Spawn "dirty" apps that can linger between sessions
	},
}
