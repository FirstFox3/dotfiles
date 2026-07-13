hl.config({
	--- General
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,
		resize_on_border = false,
		allow_tearing = false,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45},
			inactive_border = "rgba(595959aa)",
		},
	},

	--- Decoration
	decoration = {
		active_opacity = active_opacity,
		inactive_opacity = inactive_opacity,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	}
})
