hl.window_rule({
    name = "apply-opacity-everwhere",
	match = { class = ".*" },
	opacity = "0.95",
})

hl.window_rule({
    name = "remove-firefox-opacity",
	match = { class = "firefox" },
    opacity = "1"
})
