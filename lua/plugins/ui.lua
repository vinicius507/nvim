return {
	{
		"akinsho/bufferline.nvim",
		opts = function(_, opts)
			opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
		end,
	},
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		opts = function()
			local colors = require("catppuccin.palettes").get_palette()

			return {
				highlight = {
					groups = {
						InclineNormal = { guifg = colors.text, guibg = colors.mantle },
						InclineNormalNC = { guifg = colors.overlay0, guibg = colors.mantle },
					},
				},
				window = {
					margin = {
						vertical = 0,
						horizontal = 1,
					},
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			}
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
					filter = {
						find = ".*Obsidian.*",
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
		dependencies = { "MunifTanjim/nui.nvim" },
	},
}
