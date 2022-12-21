local telescope = require("telescope")
local builtin = require("telescope.builtin")
local telescope_trouble = require("trouble.providers.telescope")

local mappings = require("mappings")

telescope.setup({
	defaults = {
		entry_prefix = "  ",
		prompt_prefix = "  ",
		selection_caret = " ",
		color_devicons = true,
		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = telescope_trouble.open_with_trouble,
			},
			n = {
				["<C-x>"] = false,
				["<C-q>"] = telescope_trouble.open_with_trouble,
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
				conf = vim.fn.expand("$HOME/.config"),
				nvim = vim.fn.expand("$HOME/.config/nvim"),
			},
		},
	},
})
telescope.load_extension("frecency")
telescope.load_extension("fzy_native")

mappings.add({ "<Leader>bb", builtin.buffers, description = "Buffers List" })
mappings.add({ "<Leader>ff", builtin.find_files, description = "Find files" })
mappings.add({
	"<Leader>fF",
	function()
		telescope.extensions.frecency.frecency({ workspace = "CWD" })
	end,
	description = "Frecency",
})
mappings.add({ "<Leader>fg", builtin.live_grep, description = "Live grep" })
mappings.add({ "<Leader>fh", builtin.help_tags, description = "Help tags" })
mappings.add({ "<Leader>fr", builtin.oldfiles, description = "Recent files" })
mappings.add({ "<Leader>fk", builtin.keymaps, description = "Keymaps" })
mappings.add({
	"<Leader>fc",
	function()
		builtin.find_files({ find_command = { "fd", "--type", "f", ".", vim.fn.stdpath("config") } })
	end,
	description = "Find in .config/nvim",
})
