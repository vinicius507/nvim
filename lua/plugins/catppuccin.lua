require("catppuccin").setup({
	term_colors = true,
	styles = {
		comments = "italic",
		conditionals = "italic",
		loops = "NONE",
		functions = "NONE",
		keywords = "italic",
		strings = "NONE",
		variables = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "NONE",
		operators = "NONE",
	},
	integrations = {
		treesitter = true,
		telescope = true,
		markdown = true,
	},
})

vim.g.flavor = "mocha"
vim.cmd([[colorscheme catppuccin]])
