local M = {}

local remap = require("myriad.keymaps").remap

M.on_attach = function(_, buffer)
	remap("K", vim.lsp.buf.hover, { buffer = buffer, desc = "Hover" })
	remap("gi", vim.lsp.buf.implementation, { buffer = buffer, "Goto implementation" })
	remap("gr", vim.lsp.buf.references, { buffer = buffer, desc = "Goto references" })
	remap("gd", vim.lsp.buf.definition, { buffer = buffer, desc = "Goto definition" })
	remap("gD", vim.lsp.buf.declaration, { buffer = buffer, desc = "Goto declaration" })
	remap("gt", vim.lsp.buf.type_definition, { buffer = buffer, desc = "Goto type definition" })
	remap("<C-h>", vim.lsp.buf.signature_help, {
		buffer = buffer,
		modes = "i",
		desc = "Signature help",
	})
	remap("<F2>", vim.lsp.buf.rename, { buffer = buffer, desc = "Rename" })
	remap("<Leader>ca", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code actions" })
end

return M
