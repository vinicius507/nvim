return {
	{
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
	},
	{
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
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{
				"<Leader>gd",
				function()
					vim.cmd.DiffviewOpen("-uno")
				end,
				desc = "Diff",
			},
			{
				"<Leader>gD",
				function()
					vim.ui.input(
						{
							prompt = "Git rev: ",
							completion = function()
								return { "test" }
							end,
						},
						---@param rev string?
						function(rev)
							if rev == nil or rev == "" then
								return
							end
							vim.cmd.DiffviewOpen(rev, "--cached")
						end
					)
				end,
				desc = "Diff rev",
			},
		},
		opts = {
			keymaps = {
				view = { q = vim.cmd.DiffviewClose },
				file_panel = { q = vim.cmd.DiffviewClose },
			},
			hooks = {
				diff_buf_read = function()
					vim.opt_local.list = false
					vim.opt_local.wrap = false
				end,
			},
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = { "*", "!lazy" },
			buftype = { "*", "!prompt", "!nofile" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
				AARRGGBB = false,
				rgb_fn = true,
				hsl_fn = true,
				css = false,
				css_fn = true,
				mode = "background",
				virtualtext = "■",
			},
		},
	},
}
