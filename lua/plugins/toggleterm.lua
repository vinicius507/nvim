local ok, toggleterm = pcall(require, 'toggleterm')

if not ok then
	return
end

toggleterm.setup({
	size = 15,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = '1',
	start_in_insert = true,
	persist_size = true,
	direction = 'horizontal',
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = 'single',
		width = 1280,
		height = 720,
		winblend = 3,
		highlights = {
			border = 'Normal',
			background = 'Normal',
		},
	},
})

local Terminal = require('toggleterm.terminal').Terminal

local make_run_term = Terminal:new({
	cmd = 'make run',
	direction = 'float',
	close_on_exit = false,
	float_opts = {
		border = 'curved',
	},
	on_open = function(term)
		vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<CMD>close<CR>', {
			noremap = true,
			silent = true,
		})
	end,
})

_G.make_run = function()
	make_run_term:toggle()
end
