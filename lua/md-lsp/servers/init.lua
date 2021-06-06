local M = {}
local servers_dir = 'md-lsp.servers.'

local servers = {
	'clangd',
	'lua',
}

M.config = {}

for _, server in ipairs(servers) do
	M.config[server] = require(servers_dir .. server).config
end

return M
