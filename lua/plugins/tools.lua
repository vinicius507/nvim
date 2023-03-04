---@type LazySpec[]
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
		dependencies = { "folke/twilight.nvim" },
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
	{
		"epwalsh/obsidian.nvim",
		ft = "markdown",
		cmd = {
			"ObsidianNew",
			"ObsidianOpen",
			"ObsidianToday",
			"ObsidianYesterday",
			"ObsidianSearch",
			"ObsidianQuickSwitch",
		},
		keys = {
			{
				"<Leader>on",
				vim.cmd.ObsidianNew,
				desc = "New note",
			},
			{
				"<Leader>ot",
				vim.cmd.ObsidianToday,
				desc = "Open today's note",
			},
			{
				"<Leader>oy",
				vim.cmd.ObsidianYesterday,
				desc = "Open yesterday's note",
			},
			{
				"<Leader>op",
				vim.cmd.ObsidianOpen,
				desc = "View in Obsidian",
			},
			{
				"<Leader>ob",
				vim.cmd.ObsidianBacklinks,
				desc = "Backlinks",
			},
			{
				"<Leader>fo",
				vim.cmd.ObsidianQuickSwitch,
				desc = "Find Note",
			},
			{
				"<Leader>og",
				vim.cmd.ObsidianSearch,
				desc = "Find in Notes",
			},
			{
				"<Leader>ol",
				vim.cmd.ObsidianLink,
				desc = "Link to note",
			},
			{
				"<Leader>oL",
				vim.cmd.ObsidianLink,
				desc = "Link to new note",
			},
		},
		---@type obsidian.config.ClientOpts
		opts = {
			dir = vim.fn.expand("$HOME/Documents/myriad"),
			daily_notes = {
				folder = "journal",
			},
			---@param title string?
			---@see https://github.com/epwalsh/obsidian.nvim#customizing-note-paths-and-ids
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,
			completion = {
				nvim_cmp = true,
			},
			use_advanced_uri = true,
		},
	},
}
