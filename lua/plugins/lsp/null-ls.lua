local null_ls = require("null-ls")

null_ls.setup({
	on_attach = require("plugins.lsp.on_attach").build(),
	sources = {
		-- Python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		-- Lua
		null_ls.builtins.formatting.stylua,
	},
})
