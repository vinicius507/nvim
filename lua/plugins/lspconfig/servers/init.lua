local M = {}
local servers_dir = 'plugins.lspconfig.servers.'

local servers = {
	'sumneko_lua',
	'pyright',
	'gopls',
}

M.config = {}

for _, server in ipairs(servers) do
	M.config[server] = require(servers_dir .. server).config
end

return M
