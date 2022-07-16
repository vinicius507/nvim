local map = require("mappings")
local telescope = require("telescope")

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
map.normal("<Leader>bb", "<CMD>Telescope buffers<CR>")
map.normal("<Leader>fr", "<CMD>Telescope oldfiles<CR>")
map.normal("<Leader>fg", "<CMD>Telescope live_grep<CR>")
map.normal("<Leader>ff", "<CMD>Telescope find_files<CR>")
map.normal(
	"<Leader>pp",
	string.format("<CMD>Telescope find_files find_command=fd,--type,f,.,%s<CR>", vim.fn.stdpath("config"))
)
