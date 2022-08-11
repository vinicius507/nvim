local truezen = require("true-zen")
local mappings = require("mappings")

truezen.setup({
	modes = {
		ataraxis = {
			shade = "dark",
			backdrop = 0,
			minimum_writing_area = {
				width = 70,
				height = 44,
			},
			quit_untoggles = true,
			padding = {
				left = 52,
				right = 52,
				top = 0,
				bottom = 0,
			},
			callbacks = {
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
		minimalist = {
			ignored_buf_types = { "nofile" },
			options = {
				number = true,
				relativenumber = true,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 1,
			},
			callbacks = {
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
		narrow = {
			folds_style = "informative",
			run_ataraxis = true,
			callbacks = {
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
		focus = {
			callbacks = {
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
	},
	integrations = {
		tmux = false,
		kitty = {
			enabled = false,
			font = "+3",
		},
		twilight = false,
		lualine = false,
	},
})

mappings.add({
	"<Leader>za",
	truezen.ataraxis,
	description = "Toggle ataraxis mode",
})
mappings.add({
	"<Leader>zf",
	truezen.focus,
	description = "Toggle focus mode",
})
mappings.add({
	"<Leader>zm",
	truezen.minimalist,
	description = "Toggle minimalist mode",
})
mappings.add({
	"<Leader>zn",
	function ()
		local first_line = 0
		local last_line = vim.api.nvim_buf_line_count(0)
		truezen.narrow(first_line, last_line)
	end
})
