require("catppuccin").setup({
	term_colors = true,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		keywords = { "italic" },
	},
	integrations = {
		treesitter = true,
		telescope = true,
		markdown = true,
	},
})

vim.g.flavor = "mocha"
vim.cmd([[colorscheme catppuccin]])
