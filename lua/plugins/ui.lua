return {
	{
		"rcarriga/nvim-notify",
		config = {
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
		},
	},
	{
		"folke/noice.nvim",
		config = {
			presets = {
				bottom_search = true,
				command_palette = true,
				lsp_doc_border = true,
			},
			cmdline = {
				format = {
					python = {
						pattern = "python ",
						icon = "",
						lang = "python",
					},
				},
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
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
				cmdline_output = {
					enter = true,
				},
			},
			commands = {
				all = {
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			},
		},
	},
}
