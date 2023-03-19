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
		keys = function(plugin)
			return {
				{
					"<Leader>on",
					function()
						vim.ui.select({ "Note", "Reference", "Project" }, {
							prompt = "[Obsidian] New",
							format_item = function(item)
								return string.format("New %s", item)
							end,
						}, function(choice)
							if choice == nil then
								return
							end

							local client = require("obsidian").new(plugin.opts)

							vim.ui.input({ prompt = string.format("%s title", choice) }, function(input)
								if input == nil then
									return
								end

								local title = input
								local id = choice == "Project" and title or nil
								local dir = string.format("%s/%ss", plugin.opts.dir, choice)

								---@type obsidian.Note
								local note = client:new_note(title, id, dir)
								vim.api.nvim_command("e " .. tostring(note.path))
							end)
						end)
					end,
					desc = "New",
				},
				{
					"<Leader>ot",
					vim.cmd.ObsidianToday,
					desc = "Open today's note",
				},
				{
					"<Leader>oy",
					desc = "Open yesterday's note",
					vim.cmd.ObsidianYesterday,
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
			}
		end,
		---@type obsidian.config.ClientOpts
		opts = {
			dir = vim.fn.expand("$HOME/Documents/myriad"),
			daily_notes = {
				folder = "Journal",
			},
			templates = {
				subdir = "Templates",
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
