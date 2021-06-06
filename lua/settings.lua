local setopt = vim.opt
local cmd = vim.cmd

local options = {
	shiftwidth = 4,
	tabstop = 4,
	cinoptions = '(1s',
	number = true,
	cursorline = true,
	showmode = false,
	hidden = true,
	hlsearch = false,
	shortmess = "filnxToOFc",
	splitright = true,
	completeopt = "menuone,noselect",
}

local set_options = function(opt)
	for option, value in pairs(opt) do
		setopt[option] = value
	end
end

set_options(options)

-- Dap
cmd([[ command! -complete=file -nargs=* DebugC lua require("md-dap.c").start({<f-args>}, "gdb") ]])
cmd( [[command! -complete=file -nargs=* DebugRust lua require("md-dap.c").c.start({<f-args>}, "gdb", "rust-gdb")]] )
-- Norme.nvim
-- cmd([[ autocmd BufEnter,BufRead *.c,*.h lua require('norme').lint() ]])
-- cmd([[ autocmd BufWritePost *.c,*.h lua require('norme').lint() ]])
-- cmd([[ autocmd InsertLeave *.c,*.h lua require('norme').lint() ]])
-- cmd([[ autocmd TextChanged *.c,*.h lua require('norme').lint() ]])
