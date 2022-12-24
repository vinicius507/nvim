local mappings = require("mappings")

require("nvim-tree").setup({
	open_on_setup = false,
	hijack_cursor = true,
	hijack_netrw = true,
	ignore_buffer_on_setup = false,
	sort_by = "name",
	root_dirs = {
		".git",
		".luarc.json",
		"pyproject.toml",
		"compile_commands.json",
	},
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	remove_keymaps = false,
	reload_on_bufenter = true,
	auto_reload_on_write = true,
	sync_root_with_cwd = true,
	view = {
		adaptive_size = false,
		hide_root_folder = false,
		side = "left",
		signcolumn = "yes",
	},
	renderer = {
		group_empty = false,
		highlight_git = true,
		full_name = false,
		highlight_opened_files = "name",
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
			inline_arrows = true,
		},
		icons = {
			symlink_arrow = "  ",
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
		dotfiles = false,
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
	"<CMD>NvimTreeFindFileToggle<CR>",
	description = "Toggle file explorer",
})
