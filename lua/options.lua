local setopt = vim.opt
local vimg = vim.g
local diagnostic = vim.diagnostic

local options = {
	shiftwidth = 4,
	tabstop = 4,
	cinoptions = '(1s',
	number = true,
	cursorline = true,
	showmode = false,
	hidden = true,
	hlsearch = false,
	splitright = true,
	splitbelow = true,
	completeopt = 'menuone,noselect',
	clipboard = 'unnamedplus',
	termguicolors = true,
	undofile = true,
	undodir = os.getenv('HOME') .. '/.cache/nvim/undo',
	mouse = 'a',
	list = true,
	listchars = '',
	colorcolumn = '81',
}

local options_append = {
	shortmess = 'c',
	listchars = {
		eol = ' ',
		nbsp = ' ',
		tab = '  ',
		trail = '',
	},
}

local set_options = function(opt, opt_a)
	for option, value in pairs(opt) do
		setopt[option] = value
	end

	for option, value in pairs(opt_a) do
		if type(option) == 'table' then
			for k, v in pairs(option) do
				setopt[option]:append(string.format('%s:%s', k, v))
			end
		else
			setopt[option]:append(value)
		end
	end
end

set_options(options, options_append)

-- Neovide
vimg['neovide_remember_window_size'] = true

-- Diagnostics
diagnostic.config({
	virtual_text = {
		prefix = '',
		format = function(d)
			local signs = {
				'',
				'',
				'',
				'',
			}
			return string.format(
				'%s %s: %s',
				signs[d.severity],
				d.source,
				d.message
			)
		end,
	},
	signs = true,
	underline = {
		severity = 1,
	},
	severity_sort = true,
})
