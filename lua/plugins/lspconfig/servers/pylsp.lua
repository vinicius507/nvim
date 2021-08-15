local M = {}

M.config = {
	filetypes = { 'python' },
	on_attach = function(client, _)
		-- disable pylsp formatting if you plan on formatting via null-ls
		client.resolved_capabilities.document_formatting = false
	end,
}

return M
