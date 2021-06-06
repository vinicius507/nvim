local M = {}

M.config = {
	cmd = {
		'clangd',
		'--background-index',
		'--suggest-missing-includes'
	},
}

return M
