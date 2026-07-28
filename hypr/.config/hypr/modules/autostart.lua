-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

hl.on("hyprland.start", function()
	hl.exec_cmd('foot --class popup_fastfetch sh -c "fastfetch; exec $SHELL"')
	hl.exec_cmd("pipewire")
	hl.exec_cmd("wireplumber")
	hl.exec_cmd("pipewire-pulse")
	hl.exec_cmd("waybar")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("~/scripts/hyprpaper.sh")
end)
