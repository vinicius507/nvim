local telescope = require("telescope")
local builtin = require("telescope.builtin")

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
	extensions = {},
})
telescope.load_extension("fzy_native")

require("which-key").register({
	name = "Telescope",
	b = { builtin.buffers, "Buffers" },
	g = { builtin.live_grep, "Live grep" },
	r = { builtin.oldfiles, "Recent files" },
	f = { builtin.find_files, "Find files" },
	c = {
		function()
			builtin.find_files({ find_command = { "fd", "--type", "f", ".", vim.fn.stdpath("config") } })
		end,
		"Find files",
	},
}, { prefix = "<Leader>f" })
