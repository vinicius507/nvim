return {
	"catppuccin/nvim",
	name = "catppuccin",
	build = ":CatppuccinCompile",
	opts = {
		flavour = "mocha",
		term_colors = true,
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			keywords = { "italic" },
		},
		integrations = {
			cmp = true,
			dashboard = true,
			gitsigns = true,
			hop = true,
			illuminate = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
			lsp_trouble = true,
			markdown = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			navic = {
				enabled = true,
			},
			neogit = true,
			neotree = true,
			noice = true,
			notify = true,
			telescope = true,
			treesitter = true,
			which_key = true,
		},
	},
	lazy = false,
	priority = 1000,
}
