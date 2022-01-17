local ok, tree = pcall(require, 'nvim-tree')

if not ok then
	return
end

local config = {
	quit_on_open = 1,
	indent_markers = 1,
	git_hl = 0,
	root_folder_modifier = ':t',
	add_trailing = 0,
	group_empty = 0,
	special_files = { 'README.md', 'Makefile' },
	show_icons = { git = 0, folders = 1, files = 1 },
	icons = {
		default = '',
	},
}

local vimg = vim.g

local set_options = function(cfg)
	for key, value in pairs(cfg) do
		vimg['nvim_tree_' .. key] = value
	end
end

set_options(config)

tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	auto_close = false,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	diagnostics = {
		enable = true,
	},
	git = {
		enable = false,
		ignore = false,
		timeout = 500,
	},
	filter = {
		dotfiles = false,
	},
	view = {
		side = 'left',
		hide_root_folder = true,
		auto_resize = true,
	},
})
