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

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		virtual_text = true,
		signs = true,
		underline = true,
		update_in_insert = true,
	}
)

lspinstall.post_install_hook = function()
	setup_servers()
	vim.cmd('bufdo e')
end
