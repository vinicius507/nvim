local nvimtree = require("nvim-tree.api")
local mappings = require("mappings")

require("nvim-tree").setup({
	hijack_cursor = true,
	hijack_netrw = true,
	ignore_buffer_on_setup = false,
	sort_by = "name",
	root_dirs = { ".git", "Makefile", "README.md", "pyproject.toml", "compile_commands.json" },
	remove_keymaps = false,
	view = {
		adaptive_size = true,
		hide_root_folder = false,
		side = "left",
		signcolumn = "yes",
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		full_name = false,
		highlight_opened_files = "name",
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
			inline_arrows = true,
		},
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "pyproject.toml" },
		symlink_destination = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
	},
	filters = {
		dotfiles = true,
		custom = { "^\\.git" },
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		timeout = 400,
	},
})

mappings.add({
	"<Leader><Tab>",
	nvimtree.tree.toggle,
	description = "Toggle file explorer",
})
