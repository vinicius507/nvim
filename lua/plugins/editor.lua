---@type LazyPlugin[]
return {
	{ "elkowar/yuck.vim" },
	{ "LnL7/vim-nix" },
	{
		"mateusbraga/vim-spell-pt-br",
		init = function()
			vim.opt.spelllang:append("pt_br")
		end,
	},
	{
		"chrisgrieser/nvim-early-retirement",
		event = "VeryLazy",
		opts = {
			retirementAgeMins = 10,
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			sort_case_insensitive = true,
			window = {
				width = 32,
			},
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = true,
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				"<Leader>fc",
				function()
					require("telescope.builtin").find_files({
						cwd = vim.fn.stdpath("config"),
					})
				end,
				desc = "Find in .config/nvim",
			},
			{
				"<Leader>fp",
				function()
					vim.ui.input(
						{
							prompt = "Path: ",
							completion = "dir",
						},
						---@param path string?
						function(path)
							if path == nil then
								return
							end

							require("telescope.builtin").find_files({
								cwd = path,
							})
						end
					)
				end,
				desc = "Find in path",
			},
		},
		opts = {
			defaults = {
				entry_prefix = "  ",
				prompt_prefix = "  ",
				selection_caret = " ",
				color_devicons = true,
			},
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
				frecency = {
					show_scores = false,
					show_unindexed = true,
					ignore_patterns = { "*.git/*" },
					disable_devicons = false,
					workspaces = {
						code = vim.fn.expand("$HOME/Code"),
						nvim = vim.fn.expand("$HOME/.config/nvim"),
					},
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")

			telescope.setup(opts)
			telescope.load_extension("fzy_native")
		end,
		dependencies = {
			"tami5/sqlite.lua",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				vim.keymap.set("n", "]h", gs.next_hunk, { buffer = buffer, desc = "Next hunk" })
				vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = buffer, desc = "Prev hunk" })
				vim.keymap.set({ "n", "v" }, "<Leader>gs", function()
					local mode = vim.api.nvim_get_mode()

					if mode.mode == "n" then
						gs.stage_hunk()
						return
					end

					local range = { vim.fn.line("."), vim.fn.line("v") }

					gs.stage_hunk(range, { greedy = false })
				end, { desc = "stage hunk" })
				vim.keymap.set("n", "<Leader>gr", function()
					vim.cmd.Gitsigns("reset_hunk")
				end, { desc = "Reset hunk" })
				vim.keymap.set("n", "<Leader>gS", gs.stage_buffer, { buffer = buffer, desc = "Stage buffer" })
				vim.keymap.set("n", "<Leader>gu", gs.undo_stage_hunk, { buffer = buffer, desc = "Undo tage hunk" })
				vim.keymap.set("n", "<Leader>gR", gs.reset_buffer, { buffer = buffer, desc = "Reset buffer" })
				vim.keymap.set("n", "<Leader>gp", gs.preview_hunk, { buffer = buffer, desc = "Preview hunk" })
				vim.keymap.set("n", "<Leader>gb", function()
					gs.blame_line({ full = true })
				end, { buffer = buffer, desc = "Blame line" })
			end,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "*",
		keys = {
			{
				"<Leader>wp",
				function()
					local id = require("window-picker").pick_window()

					if not id then
						return
					end

					vim.api.nvim_set_current_win(id)
				end,
				desc = "Pick window",
			},
		},
		opts = function()
			local colors = require("catppuccin.palettes").get_palette()

			return {
				autoselect_one = true,
				include_current_win = true,
				filter_rules = {
					bo = {
						filetype = {
							"neo-tree",
							"neo-tree-popup",
							"notify",
						},
						buftype = {
							"quickfix",
							"terminal",
						},
					},
				},
				fg_color = colors.base,
				current_win_hl_color = colors.red,
				other_win_hl_color = colors.green,
				selection_display = function(char)
					return string.format("[%s] %s", char, "%f")
				end,
			}
		end,
	},
}
