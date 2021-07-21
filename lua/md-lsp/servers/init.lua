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

local null_ls = require('null-ls')
local norme = require('norme')

local norminette_c = norme.norminette_c
local norminette_h = norme.norminette_h

null_ls.config({
	sources = {
		null_ls.builtins.formatting.stylua,
		norminette_c,
		norminette_h,
	},
})

require('lspconfig')['null-ls'].setup(M.config['null-ls'])

return M
