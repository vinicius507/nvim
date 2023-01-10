return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	keys = {
		{
			"<Leader>a",
			function()
				vim.cmd.TSTextobjectSwapNext("@parameter.inner<CR>")
			end,
			desc = "Swap next parameter",
		},
		{
			"<Leader>A",
			function()
				vim.cmd.TSTextobjectSwapPrevious("@parameter.inner<CR>")
			end,
			desc = "Swap previous parameter",
		},
		{
			"vaf",
			function()
				vim.cmd.TSTextobjectSelect("@function.outer<CR>")
			end,
			desc = "outer function",
		},
		{
			"vif",
			function()
				vim.cmd.TSTextobjectSelect("@function.inner<CR>")
			end,
			desc = "inner function",
		},
		{
			"vac",
			function()
				vim.cmd.TSTextobjectSelect("@class.outer<CR>")
			end,
			desc = "outer class",
		},
		{
			"vic",
			function()
				vim.cmd.TSTextobjectSelect("@class.inner<CR>")
			end,
			desc = "inner class",
		},
	},
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"json",
			"bash",
			"toml",
			"yaml",
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
			lsp_interop = { enable = true },
		},
		refactor = {
			highlight_definitions = { enable = true },
			highlight_current_scope = { enable = false },
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-refactor",
	},
}
