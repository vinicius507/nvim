local colors = require("catppuccin.palettes").get_palette()

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
	},
})

vim.g.flavor = "mocha"
vim.cmd([[colorscheme catppuccin]])
