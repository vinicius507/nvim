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
	diagnostics_format = '#{s}: #{m}',
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd(
				'autocmd BufWritePre *.lua,*.py,*.ts,*.tsx,*.go lua vim.lsp.buf.formatting_sync({}, 200)'
			)
		end
	end,
})
