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
		autotag = {
			enable = true,
		},
		highlight = {
			enable = true,
		},
	},
	dependencies = { "windwp/nvim-ts-autotag" },
}
