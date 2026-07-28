-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 10,
		gaps_out = 10,

		border_size = 1,

		col = {
			active_border = { colors = { "rgba(0f7fcfff)", "rgba(00afffff)" }, angle = 100 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "master",
	},

	decoration = {
		rounding = 10,
		rounding_power = 10,

		-- Change transparency of focused and unfocused windows
		active_opacity = 0.9,
		inactive_opacity = 0.7,

		shadow = {
			enabled = true,
			range = 10,
			render_power = 10,
			color = 0xee2a1608,
		},

		blur = {
			enabled = true,
			size = 10,
			passes = 2,
			vibrancy = 0.3,
		},
	},

	animations = {
		enabled = true,
	},
})
