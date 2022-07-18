local ts_config = require("nvim-treesitter.configs")
local mappings = require("mappings")

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

mappings.add({ "vaf", "<CMD>TSTextobjectSelect @function.outer<CR>", description = "outer function" })
mappings.add({ "vif", "<CMD>TSTextobjectSelect @function.inner<CR>", description = "inner function" })
mappings.add({ "vac", "<CMD>TSTextobjectSelect @class.outer<CR>", description = "outer class" })
mappings.add({ "vic", "<CMD>TSTextobjectSelect @class.inner<CR>", description = "inner class" })
mappings.add({ "]m", "<CMD>TSTextobjectGotoNextStart @function.outer<CR>", description = "Next function start" })
mappings.add({ "]M", "<CMD>TSTextobjectGotoNextEnd @function.outer<CR>", description = "Next function end" })
mappings.add({
	"[m",
	"<CMD>TSTextobjectGotoPreviousStart @function.outer<CR>",
	description = "Previous function start",
})
mappings.add({ "[M", "<CMD>TSTextobjectGotoPreviousEnd @function.outer<CR>", description = "Previous function end" })
mappings.add({ "]]", "<CMD>TSTextobjectGotoNextStart @class.outer<CR>", description = "Next class start" })
mappings.add({ "][", "<CMD>TSTextobjectGotoNextEnd @class.outer<CR>", description = "Next class end" })
mappings.add({ "[[", "<CMD>TSTextobjectGotoPreviousStart @class.outer<CR>", description = "Previous class start" })
mappings.add({ "[]", "<CMD>TSTextobjectGotoPreviousEnd @class.outer<CR>", description = "Previous class end" })
