require("notify").setup({
	background_colour = "NormalFloat",
	fps = 30,
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
	level = "INFO",
	max_width = 64,
	minimum_width = 50,
	render = "default",
	stages = "fade_in_slide_out",
	timeout = 5000,
	top_down = true,
})
