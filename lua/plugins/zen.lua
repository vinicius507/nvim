return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	keys = {
		{
			"<Leader>z",
			vim.cmd.ZenMode,
			desc = "Zen mode",
		},
	},
	opts = {
		plugins = {
			gitsigns = true,
		},
	},
}
