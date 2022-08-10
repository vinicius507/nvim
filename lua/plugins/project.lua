require("project_nvim").setup({
	manual_mode = false,
	detection_methods = { "lsp", "pattern" },
	patterns = { ".git", "package.json", "pyproject.toml" },
	ignore_lsp = {},
	exclude_dirs = { ".git", ".cache" },
	show_hidden = true,
	silent_chdir = true,
	datapath = vim.fn.stdpath("data"),
})
require("telescope").load_extension("projects")
require("mappings").add({
	"<Leader>fp",
	"<CMD>Telescope projects<CR>",
	description = "Find project",
})
