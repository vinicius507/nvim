local telescope = require("telescope")
local builtin = require("telescope.builtin")
local mappings = require("mappings")

telescope.setup({
	defaults = {
		entry_prefix = "  ",
		prompt_prefix = "  ",
		selection_caret = " ",
		color_devicons = true,
		mappings = {
			i = { ["<C-x>"] = false },
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
	},
})
telescope.load_extension("fzy_native")

mappings.add({ "<Leader>bb", builtin.buffers, description = "Buffers List" })
mappings.add({ "<Leader>ff", builtin.find_files, description = "Find files" })
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
