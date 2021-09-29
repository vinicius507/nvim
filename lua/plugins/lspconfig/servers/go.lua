local M = {}

M.config = {
	on_attach = function(client, _)
		client.resolved_capabilities.document_formatting = false
	end,
}

return M
