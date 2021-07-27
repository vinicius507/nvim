local M = {}
local servers_dir = 'md-lsp.servers.'

local servers = {
	'cpp',
	'lua',
	'typescript',
	'null-ls',
	'java',
}

M.config = {}

for _, server in ipairs(servers) do
	M.config[server] = require(servers_dir .. server).config
end

local null_ls = require('null-ls')
local norme = require('norme')

null_ls.config({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})
norme.setup()

require('lspconfig')['null-ls'].setup(M.config['null-ls'])

return M
