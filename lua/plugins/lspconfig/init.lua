-- Config
local ok1, lspinstall = pcall(require, 'lspinstall')
local ok2, lspconfig = pcall(require, 'lspconfig')

if not ok1 or not ok2 then
	return
end

local servers = require('plugins.lspconfig.servers')

local setup_servers = function()
	lspinstall.setup()
	local installed = lspinstall.installed_servers()
	for _, server in pairs(installed) do
		lspconfig[server].setup(servers.config[server] or {})
	end
end

setup_servers()

lspinstall.post_install_hook = function()
	setup_servers()
	vim.cmd('bufdo e')
end
