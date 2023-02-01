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
		},
		highlight = {
			enable = true,
		},
	},
}
