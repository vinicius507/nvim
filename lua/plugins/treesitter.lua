local ts_config = require("nvim-treesitter.configs")

ts_config.setup({
	ensure_installed = {
		"c",
		"lua",
		"json",
		"bash",
		"toml",
		"yaml",
		"cmake",
		"python",
		"comment",
		"dockerfile",
	},
	highlight = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		lsp_interop = {
			enable = true,
			peek_definition_code = {
				["<Leader>gc"] = "@function.outer",
			},
		},
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },
		smart_rename = { enable = false },
		navigation = {
			enable = true,
			keymaps = {
				goto_definition_lsp_fallback = "<Leader>gd",
				list_definitions = "<Leader>gl",
				list_definitions_toc = "<Leader>gO",
				goto_next_usage = "<a-=>",
				goto_previous_usage = "<a-->",
			},
		},
	},
})

require("which-key").register({
	vaf = { "<CMD>TSTextobjectSelect @function.outer<CR>", "outer function" },
	vif = { "<CMD>TSTextobjectSelect @function.inner<CR>", "inner function" },
	vac = { "<CMD>TSTextobjectSelect @class.outer<CR>", "outer class" },
	vic = { "<CMD>TSTextobjectSelect @class.inner<CR>", "inner class" },
	["]m"] = {
		"<CMD>TSTextobjectGotoNextStart @function.outer<CR>",
		"Next function start",
	},
	["]M"] = {
		"<CMD>TSTextobjectGotoNextEnd @function.outer<CR>",
		"Next function end",
	},
	["[m"] = {
		"<CMD>TSTextobjectGotoPreviousStart @function.outer<CR>",
		"Previous function start",
	},
	["[M"] = {
		"<CMD>TSTextobjectGotoPreviousEnd @function.outer<CR>",
		"Previous function end",
	},
	["]]"] = {
		"<CMD>TSTextobjectGotoNextStart @class.outer<CR>",
		"Next class start",
	},
	["]["] = {
		"<CMD>TSTextobjectGotoNextEnd @class.outer<CR>",
		"Next class end",
	},
	["[["] = {
		"<CMD>TSTextobjectGotoPreviousStart @class.outer<CR>",
		"Previous class start",
	},
	["[]"] = {
		"<CMD>TSTextobjectGotoPreviousEnd @class.outer<CR>",
		"Previous class end",
	},
})
