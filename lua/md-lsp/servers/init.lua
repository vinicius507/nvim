local M = {}
local servers_dir = 'md-lsp.servers.'

local servers = {
	'cpp',
	'lua',
	'typescript',
	'null-ls',
}

M.config = {}

for _, server in ipairs(servers) do
	M.config[server] = require(servers_dir .. server).config
end

-- Norme.nvim
require('norme').setup()
require('lspconfig')['null-ls'].setup(M.config['null-ls'])

return M
