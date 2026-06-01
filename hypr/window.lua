hl.window_rule({
	name = "apply-opacity-everwhere",
	match = { class = ".*" },
	opacity = "0.95",
})

hl.window_rule({
	name = "remove-firefox-opacity",
	match = { class = "firefox" },
	opacity = "1",
})

hl.window_rule({
	name = "terminal-WS1",
	match = {
		class = "alacritty",
	},
	workspace = "1",
})

hl.window_rule({
	name = "firefox-WS2",
	match = {
		class = "firefox",
	},
	workspace = "2",
})

hl.window_rule({
	name = "firefox-WS3",
	match = {
		class = "firefox",
	},
	workspace = "3",
})
