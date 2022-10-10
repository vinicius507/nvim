local wk = require("which-key")

wk.setup({
	{
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		operators = { gc = "Comments" },
		key_labels = {
			["<leader>"] = "LEADER",
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
		popup_mappings = {
			scroll_down = "<c-d>",
			scroll_up = "<c-u>",
		},
		window = {
			border = "single",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 2, 2, 2, 2 },
			winblend = 0,
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		ignore_missing = false,
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
		show_help = true,
	},
})
wk.register({
	["<Leader>"] = {
		["1"] = "which_key_ignore",
		["2"] = "which_key_ignore",
		["3"] = "which_key_ignore",
		["4"] = "which_key_ignore",
		["5"] = "which_key_ignore",
		["6"] = "which_key_ignore",
		["7"] = "which_key_ignore",
		["8"] = "which_key_ignore",
		["9"] = "which_key_ignore",
		b = { name = "Buffers" },
		c = { name = "Code" },
		f = { name = "Telescope" },
		g = { name = "Git", t = "Toggle" },
		o = { name = "Open" },
		p = { name = "Packer" },
		w = { name = "Window" },
		z = { name = "Zen mode" },
	},
})
