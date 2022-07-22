local configs = {}

local lspconfig = require("lspconfig")
local on_attach = require("plugins.lsp.on_attach")

configs.clangd = {}

configs.pylsp = {
	settings = {
		pylsp = {
			plugins = {
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				flake8 = { enabled = true },
				pydocstyle = { enabled = true },
				pylint = { enabled = false },
				rope_completion = { enabled = true },
			},
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

local default_config = {
	on_attach = on_attach.build(),
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
for server, config in pairs(configs) do
	config = vim.tbl_deep_extend("force", default_config, config)
	lspconfig[server].setup(config)
end
