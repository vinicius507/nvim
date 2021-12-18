local M = {}

M.config = {
	settings = {
		python = {
			pythonPath = vim.env.ASDF_USER_SHIMS and string.format(
				'%s/python',
				vim.env.ASDF_USER_SHIMS
			) or 'python',
			venvPath = string.format('%s/.local/virtualenvs', os.getenv('HOME')),
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = 'workspace',
				extraPaths = { './srcs', './src' },
				typeCheckingMode = 'basic',
				useLibraryCodeForTypes = true,
				diagnosticSeverityOverrides = {
					reportPrivateImportUsage = false,
				},
			},
		},
	},
}

return M
