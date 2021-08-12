local null_ls = require('null-ls')
local ok2, lspconfig = pcall(require, 'lspconfig')

if not ok2 then
	return
end

null_ls.config({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
	},
})

lspconfig['null-ls'].setup({
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd(
				'autocmd BufWritePre *.lua,*.py,*.ts,*.tsx lua vim.lsp.buf.formatting_sync()'
			)
		end
	end,
})
