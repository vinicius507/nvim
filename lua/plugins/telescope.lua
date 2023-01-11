return {
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
					{ prompt = "Path: " },
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
			desc = "Find in .config/nvim",
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
}
