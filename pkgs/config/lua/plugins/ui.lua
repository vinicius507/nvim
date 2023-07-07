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
		opts = function(_, opts)
			opts.presets.lsp_doc_border = true
			opts.routes = vim.list_extend(opts.routes, {
				{
					filter = {
						cmdline = true,
						event = "msg_show",
						cleared = true,
						["not"] = {
							kind = "",
						},
					},
					view = "cmdline_output",
				},
			})
			opts.views = { cmdline_output = { enter = true } }
			opts.commands = {
				all = {
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}
		end,
	},
	{
		"folke/edgy.nvim",
		opts = function(_, defaultOpts)
			local opts = {
				left = {},
			}
			return vim.tbl_deep_extend("force", defaultOpts, opts)
		end,
	},
}
