return {
	"nvim-neorg/neorg",
	ft = "norg",
	cmd = "Neorg",
	build = ":Neorg sync-parsers",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.export"] = {},
			["core.presenter"] = {
				config = {
					zen_mode = "zen-mode",
				},
			},
			["core.norg.concealer"] = {},
			["core.norg.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
			["core.norg.dirman"] = {
				config = {
					workspaces = {
						work = "~/Documents/work/",
						personal = "~/Documents/personal/",
					},
				},
			},
			["core.integrations.nvim-cmp"] = {},
		},
	},
	dependencies = {
		"folke/zen-mode.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
