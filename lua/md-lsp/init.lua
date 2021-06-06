local lspinstall = require('lspinstall')
local lspconfig = require('lspconfig')
local lsp_signature = require('lsp_signature')
local servers = require('md-lsp/servers')

local function setup_servers()
	lspinstall.setup()
	local installed = lspinstall.installed_servers()
	for _, server in pairs(installed) do
		lspconfig[server].setup(servers.config[server] or {})
	end
end

setup_servers()

lsp_signature.on_attach({
	bind = true,
	doc_lines = 2,
	floating_window = true,
	hint_enable = false,
	hint_prefix = "",
	hint_scheme = "String",
	use_lspsaga = false,
	hi_parameter = "Search",
	max_height = 12,
	max_width = 120,
	handler_opts = {
		border = "single"
	},
})

lspinstall.post_install_hook = function ()
	setup_servers()
	vim.cmd("bufdo e")
end
