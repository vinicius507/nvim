require("noice").setup({
	cmdline = {
		format = {
			search_up = {
				view = "cmdline",
			},
			search_down = {
				view = "cmdline",
			},
			python = {
				pattern = "python ",
				icon = "",
				lang = "python",
			},
		},
	},
	lsp = {
		hover = { enabled = false },
		signature = { enabled = false },
	},
	routes = {
		{
			filter = {
				any = {
					{ find = "%d+L, %d+B" },
				},
				event = "msg_show",
			},
			opts = { skip = true },
		},
		{
			filter = { event = "msg_showmode" },
			view = "notify",
		},
		{
			filter = {
				min_height = 6,
				event = "msg_show",
			},
			view = "messages",
		},
		{
			filter = {
				cmdline = true,
				event = "msg_show",
			},
			view = "cmdline_output",
		},
	},
	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%",
			},
			border = {
				style = "none",
				padding = { 1, 1 },
			},
			size = {
				width = 60,
				height = "auto",
			},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 7,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "none",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
	},
})
