return {
	"catppuccin/nvim",
	name = "catppuccin",
	build = ":CatppuccinCompile",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
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
				noice = true,
				notify = true,
				neogit = true,
				barbar = true,
				gitsigns = true,
				hop = true,
				nvimtree = {
					enabled = true,
					show_root = true,
					transparent_panel = false,
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
	lazy = false,
	priority = 1000,
}
