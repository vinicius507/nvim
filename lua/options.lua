local setopt = vim.opt
local vimg = vim.g

local options = {
	shiftwidth = 4,
	tabstop = 4,
	cinoptions = '(1s',
	number = true,
	cursorline = true,
	showmode = false,
	hidden = true,
	hlsearch = false,
	shortmess = 'filnxToOFc',
	splitright = true,
	splitbelow = true,
	completeopt = 'menuone,noselect',
	clipboard = 'unnamedplus',
	termguicolors = true,
	undofile = true,
	undodir = os.getenv('HOME') .. '/.cache/nvim/undo',
	mouse = 'a',
}

local set_options = function(opt)
	for option, value in pairs(opt) do
		setopt[option] = value
	end
end

set_options(options)

vimg['neovide_remember_window_size'] = true
