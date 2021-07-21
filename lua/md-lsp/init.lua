-- Config
local lspinstall = require('lspinstall')
local lspconfig = require('lspconfig')
local servers = require('md-lsp/servers')
-- Signature
local lspsignature = require('lsp_signature')
local signature = require('md-lsp/signature')
-- Saga
local lspsaga = require('lspsaga')
local saga = require('md-lsp/saga')
-- Trouble
local trouble = require('trouble')
-- Rooter
local rooter = require('lsp-rooter')

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

lspsignature.on_attach(signature.config)

lspsaga.init_lsp_saga(saga.config)

trouble.setup()

rooter.setup()
