local ok, null_ls = pcall(require, 'null-ls')

if not ok then
	return
end

local norme
ok, norme = pcall(require, 'norme')

if not ok then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.golines,
		norme.diagnostics,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd(
				'autocmd BufWritePre *.lua,*.py,*.go lua vim.lsp.buf.formatting_sync({}, 500)'
			)
		end
	end,
})
