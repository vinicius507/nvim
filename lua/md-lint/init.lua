local lint = require('lint')
local norme = require('norme').linter

lint.linters.norme = norme

require('lint').linters_by_ft = {
	c = { 'norme', },
	cpp = { 'norme', }, -- for header files
}

-- Norme.nvim options
vim.cmd "autocmd BufEnter,BufRead *.c,*.h lua require('norme').lint()"
vim.cmd "autocmd BufWritePost *.c,*.h lua require('norme').lint()"
vim.cmd "autocmd InsertLeave *.c,*.h lua require('norme').lint()"
vim.cmd "autocmd TextChanged *.c,*.h lua require('norme').lint()"
