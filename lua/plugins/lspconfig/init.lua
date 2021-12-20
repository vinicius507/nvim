local ok1, lspinstall = pcall(require, 'nvim-lsp-installer')

if not ok1 then
	return
end

local servers = require('plugins.lspconfig.servers')

local default = {
	capabilities = require('cmp_nvim_lsp').update_capabilities(
		vim.lsp.protocol.make_client_capabilities(),
		{
			snippetSupport = true,
		}
	),
}

lspinstall.on_server_ready(function(server)
	local opts = vim.tbl_deep_extend(
		'force',
		default,
		servers.config[server.name] or {}
	)
	server:setup(opts)
end)
