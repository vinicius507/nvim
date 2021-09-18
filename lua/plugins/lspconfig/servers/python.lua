local M = {}

M.config = {
	settings = {
		python = {
			pythonPath = string.format('%s/python', vim.env.ASDF_USER_SHIMS)
				or 'python',
			venvPath = string.format('%s/.local/virtualenvs', os.getenv('HOME')),
			analysis = {
				diagnosticMode = 'workspace',
				extraPaths = { './srcs', './src' },
			},
		},
	},
}

return M
