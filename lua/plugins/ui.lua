return {
	{
		"akinsho/bufferline.nvim",
		opts = function(_, opts)
			opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
		end,
	},
	{
		"anuvyklack/windows.nvim",
		event = "WinNew",
		keys = {
			{
				"<Leader>wW",
				vim.cmd.WindowsToggleAutowidth,
				desc = "Toggle auto width",
			},
			{
				"<Leader>wZ",
				vim.cmd.WindowsMaximize,
				desc = "Zoom",
			},
			{
				"<Leader>w=",
				vim.cmd.WindowsEqualize,
				desc = "Equalize windows",
			},
		},
		opts = true,
		dependencies = { "anuvyklack/middleclass" },
	},
	{
		"rcarriga/nvim-notify",
		opts = {
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
		opts = {
			presets = { lsp_doc_border = true },
			routes = {
				{
					filter = {
						any = {
							{ find = "%d+L, %d+B", event = "msg_show" },
							{ find = "Updated frontmatter", event = "notify" },
						},
					},
					view = "mini",
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
		dependencies = { "MunifTanjim/nui.nvim" },
	},
}
