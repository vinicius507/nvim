return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	---@type TSConfig
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"comment",
			"dockerfile",
			"fish",
			"go",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"python",
			"toml",
			"yaml",
			"yuck",
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
