return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	---@type TSConfig
	opts = {
		ensure_installed = {},
		autotag = {
			enable = true,
		},
		highlight = {
			enable = true,
		},
	},
	dependencies = { "windwp/nvim-ts-autotag" },
}
