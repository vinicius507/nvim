local nvimtree = require("nvim-tree.api")
local nvimtree_view = require("nvim-tree.view")
local mappings = require("mappings")

require("nvim-tree").setup({
	open_on_setup = true,
	hijack_cursor = true,
	hijack_netrw = true,
	ignore_buffer_on_setup = false,
	sort_by = "name",
	root_dirs = {
		".git",
		"rc.lua",
		"Makefile",
		"README.md",
		"pyproject.toml",
		"compile_commands.json",
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

local function is_file_buffer(buf)
	local buftype = vim.api.nvim_buf_get_option(buf, "buftype")

	-- If buftype is empty, then it is a normal buffer
	local buf_is_file = buftype == ""
	local buf_is_loaded = vim.api.nvim_buf_is_loaded(buf)
	return buf_is_file and buf_is_loaded
end

local function get_next_buf(buf)
	local file_buffers = vim.tbl_filter(is_file_buffer, vim.api.nvim_list_bufs())

	if #file_buffers <= 1 then
		return nil
	end

	local buf_idx = -1
	for idx, file_buf in pairs(file_buffers) do
		if file_buf == buf then
			buf_idx = idx
			break
		end
	end
	if buf_idx == 1 then
		return file_buffers[buf_idx + 1]
	end
	return file_buffers[buf_idx - 1]
end

local function kill_buffer()
	local buf = vim.api.nvim_get_current_buf()

	-- If it is NvimTree just close it
	if vim.api.nvim_buf_get_option(buf, "filetype") == "NvimTree" then
		nvimtree.tree.close()
		return
	end

	local next_buf = get_next_buf(buf)
	if next_buf == nil then
		-- Create scratch Buffer
		next_buf = vim.api.nvim_create_buf(1, 1)
	end
	vim.api.nvim_buf_delete(buf, { force = true })
	vim.api.nvim_set_current_buf(next_buf)
end

mappings.add({
	"<Leader>bk",
	kill_buffer,
	description = "Kill Buffer",
})
mappings.add({
	"<Leader>fD",
	function()
		if vim.fn.confirm(string.format("Delete %s?", vim.fn.expand("%:t")), "&Yes\n&No", 1) == 1 then
			vim.fn.delete(vim.fn.expand("%"))
			kill_buffer()
		end
	end,
	description = "Delete file",
})
mappings.add({
	"<Leader>wq",
	function()
		local windows = vim.api.nvim_tabpage_list_wins(0)
		if nvimtree_view.is_visible() and #windows == 2 then
			nvimtree.tree.close()
		end
		vim.cmd([[quit]])
	end,
	description = "Close window",
})
