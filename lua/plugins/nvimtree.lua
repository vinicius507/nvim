local nvimtree = require("nvim-tree.api")
local nvimtree_view = require("nvim-tree.view")
local mappings = require("mappings")

require("nvim-tree").setup({
	open_on_setup = true,
	hijack_cursor = true,
	hijack_netrw = true,
	ignore_buffer_on_setup = false,
	sort_by = "name",
	root_dirs = { "compile_commands.json", "Makefile", "pyproject.toml", ".git", "README.md" },
	remove_keymaps = false,
	reload_on_bufenter = true,
	auto_reload_on_write = true,
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
	"<CMD>NvimTreeFindFile<CR>",
	description = "Toggle file explorer",
})

mappings.add({
	"<Leader>bk",
	function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
			return
		end
		local buf = vim.api.nvim_get_current_buf()
		if nvimtree_view.is_visible() then
			local buffers = vim.tbl_filter(function(b)
				if vim.api.nvim_buf_get_option(b, "buftype") == "nofile" then
					return false
				end
				return vim.api.nvim_buf_is_loaded(b)
			end, vim.api.nvim_list_bufs())
			if #buffers <= 1 then
				local scratch = vim.api.nvim_create_buf(1, 1)
				vim.api.nvim_win_set_buf(0, scratch)
			else
				local index = 1
				while buffers[index] ~= buf do
					index = index + 1
				end
				if index < #buffers then
					vim.api.nvim_win_set_buf(0, buffers[index + 1])
				else
					vim.api.nvim_win_set_buf(0, buffers[index - 1])
				end
			end
		end
		vim.api.nvim_buf_delete(buf, { force = true })
	end,
	description = "Kill Buffer",
})
mappings.add({
	"<Leader>wq",
	function ()
		local windows = vim.api.nvim_tabpage_list_wins(0)
		if nvimtree_view.is_visible() and #windows == 2 then
			nvimtree.tree.close()
		end
		vim.cmd[[quit]]
	end,
	description = "Close window",
})
