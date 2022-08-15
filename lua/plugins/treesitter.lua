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
		},
		swap = { enable = true },
		move = { enable = true, set_jumps = true },
		lsp_interop = { enable = true },
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },
	},
})

mappings.add({ "<Leader>a", "<CMD>TSTextobjectSwapNext @parameter.inner<CR>", description = "Swap next parameter" })
mappings.add({ "<Leader>A", "<CMD>TSTextobjectSwapPrevious @parameter.inner<CR>", description = "Swap previous parameter" })
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
