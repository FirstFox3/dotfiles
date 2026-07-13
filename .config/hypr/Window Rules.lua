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
	opacity        = "1 override",
	float          = true,
	pin            = true,
})

hl.window_rule({
	name = "Pavucontrol",
	match = {
		title      = "Volume Control",
	},
	float          = true,
	center         = true,
	size           = { "monitor_w * 0.75", "monitor_h * 0.75" }
})
