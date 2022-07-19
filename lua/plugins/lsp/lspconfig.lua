local configs = {}

local lspconfig = require("lspconfig")
local on_attach = require("plugins.lsp.on_attach")

configs.pylsp = {
	settings = {
		plugins = {
			flake8 = { enabled = true },
			pydocstyle = { enabled = true },
			rope_completion = { enabled = true },
		},
	},
}

configs.sumneko_lua = {
	on_attach = on_attach.build({ formatting = false }),
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}

local default_config = { on_attach = on_attach.build() }
for server, config in pairs(configs) do
	config = vim.tbl_deep_extend("force", default_config, config)
	lspconfig[server].setup(config)
end
