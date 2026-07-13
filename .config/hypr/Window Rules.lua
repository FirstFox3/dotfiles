hl.window_rule({
	name = "xwayland-dragging-patch",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},
	no_focus       = false,
})

hl.window_rule({
	name = "firefox-pip-content-correction",
	match = {
		title      = "Picture-in-Picture",
	},
	content        = "video",
})

hl.window_rule({
	name = "pin-float-videos",
	match = {
		content    = "video",
	},
	opacity        = 2,
	float          = true,
	pin            = true,
})
