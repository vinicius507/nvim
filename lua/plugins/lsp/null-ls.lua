local null_ls = require("null-ls")

null_ls.setup({
	on_attach = require("plugins.lsp.on_attach").build(),
	sources = { null_ls.builtins.formatting.stylua },
})
