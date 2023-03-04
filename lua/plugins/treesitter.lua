return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"json",
			"bash",
			"fish",
			"toml",
			"yaml",
			"python",
			"comment",
			"dockerfile",
			"norg",
			"markdown",
			"markdown_inline",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "markdown" },
		},
	},
}
