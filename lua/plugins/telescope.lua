local remap = require("myriad.keymaps").remap

return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")

		telescope.setup({
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
		})
		telescope.load_extension("frecency")
		telescope.load_extension("fzy_native")

		remap("<Leader>bb", builtin.buffers, { desc = "Buffers List" })
		remap("<Leader>ff", builtin.find_files, { desc = "Find files" })
		remap("<Leader>fF", function()
			telescope.extensions.frecency.frecency({ workspace = "CWD" })
		end, { desc = "Frecency" })
		remap("<Leader>fg", builtin.live_grep, { desc = "Live grep" })
		remap("<Leader>fh", builtin.help_tags, { desc = "Help tags" })
		remap("<Leader>fr", builtin.oldfiles, { desc = "Recent files" })
		remap("<Leader>fk", builtin.keymaps, { desc = "Keymaps" })
		remap("<Leader>fc", function()
			builtin.find_files({
				find_command = {
					"fd",
					"--type",
					"f",
					".",
					vim.fn.stdpath("config"),
				},
			})
		end, { desc = "Find in .config/nvim" })
		remap("<Leader>fp", function()
			local path = vim.fn.input("Path: ", vim.fn.getcwd(), "dir")

			if path == nil or path == "" then
				return
			end

			local stat, err = vim.loop.fs_stat(path)

			if err ~= nil then
				vim.api.nvim_echo({ { err, "ErrorMsg" } }, true, {})
				return
			end

			builtin.find_files({
				find_command = {
					"fd",
					"--type",
					"f",
					".",
					path,
				},
			})
		end, { desc = "Find in path" })
	end,
	dependencies = {
		"tami5/sqlite.lua",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
	},
}
