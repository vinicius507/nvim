return {
	"nvim-neorg/neorg",
	ft = "norg",
	cmd = "Neorg",
	build = ":Neorg sync-parsers",
	keys = function(plugin)
		return {
			{ "<Leader>n", desc = "Neorg" },
			{
				"<Leader>nj",
				function()
					vim.cmd.Neorg("journal")
				end,
				desc = "Journal",
			},
			{
				"<Leader>nw",
				function()
					vim.ui.select(vim.tbl_keys(plugin.workspaces), {
						prompt = "Switch to Neorg workspace: ",
					}, function(workspace)
						vim.cmd.Neorg("workspace", workspace)
					end)
				end,
				desc = "Switch to workspace",
			},
		}
	end,
	workspaces = {
		work = "~/Documents/work/",
		personal = "~/Documents/personal/",
	},
	opts = function(plugin)
		return {
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
					config = { engine = "nvim-cmp" },
				},
				["core.norg.dirman"] = {
					config = {
						workspaces = plugin.workspaces,
					},
				},
				["core.integrations.nvim-cmp"] = {},
			},
		}
	end,
	dependencies = {
		"folke/zen-mode.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
