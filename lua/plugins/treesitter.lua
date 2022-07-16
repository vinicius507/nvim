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
