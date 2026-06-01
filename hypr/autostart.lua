-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	hl.exec_cmd("alacritty")
	hl.exec_cmd("firefox")
	hl.exec_cmd("firefox")

	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("~/.config/hypr/scripts/wallpaper_startup.sh")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("cliphist wipe")
	hl.exec_cmd("hypridle")
end)
