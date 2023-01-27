return {
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
			{
				"<Leader>fR",
				function()
					require("telescope").extensions.frecency.frecency()
				end,
				desc = "Frecency",
			},
		},
		opts = {
			defaults = {
				entry_prefix = "  ",
				prompt_prefix = "  ",
				selection_caret = " ",
				color_devicons = true,
				mappings = {
					i = {
						["<C-x>"] = false,
					},
					n = {
						["<C-x>"] = false,
					},
				},
			},
			pickers = {
				buffers = {
					theme = "ivy",
					previewer = false,
					layout_config = {
						height = 15,
					},
				},
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
			telescope.load_extension("frecency")
			telescope.load_extension("fzy_native")
		end,
		dependencies = {
			"tami5/sqlite.lua",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
		},
	},
	{
		"phaazon/hop.nvim",
		keys = {
			{
				"gs<Space>",
				function()
					require("hop").hint_char2()
				end,
				desc = "Hop to bigram",
			},
		},
		opts = {
			case_insensitive = true,
			create_hl_autocmd = false,
			uppercase_labels = false,
			multi_windows = true,
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
				vim.keymap.set("n", "<Leader>gs", function()
					vim.cmd.Gitsigns("stage_hunk")
				end, { desc = "Stage hunk" })
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
}
