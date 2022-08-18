require("catppuccin").setup({
	term_colors = true,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		keywords = { "italic" },
	},
	integrations = {
		cmp = true,
		treesitter = true,
		telescope = true,
		markdown = true,
		neogit = true,
		barbar = true,
		gitsigns = true,
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = false,
		},
	},
})

vim.g.flavor = "mocha"
vim.cmd([[colorscheme catppuccin]])
