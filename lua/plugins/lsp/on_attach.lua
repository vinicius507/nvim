local M = {}
local mappings = require("mappings")

local function add_mappings(buffer)
	mappings.add({ "K", vim.lsp.buf.hover, buffer = buffer, description = "Hover" })
	mappings.add({ "gi", vim.lsp.buf.implementation, buffer = buffer, "Goto implementation" })
	mappings.add({ "gr", vim.lsp.buf.references, buffer = buffer, description = "Goto references" })
	mappings.add({ "gd", vim.lsp.buf.definition, buffer = buffer, description = "Goto definition" })
	mappings.add({ "gD", vim.lsp.buf.declaration, buffer = buffer, description = "Goto declaration" })
	mappings.add({ "gt", vim.lsp.buf.type_definition, buffer = buffer, description = "Goto type definition" })
	mappings.add({
		"<C-h>",
		vim.lsp.buf.signature_help,
		buffer = buffer,
		modes = "i",
		description = "Signature help",
	})
	mappings.add({ "<Leader>cr", vim.lsp.buf.rename, buffer = buffer, description = "Rename" })
	mappings.add({ "<Leader>ca", vim.lsp.buf.code_action, buffer = buffer, description = "Code actions" })
	mappings.add({
		"<Leader>cf",
		function()
			local get_mark = vim.api.nvim_buf_get_mark
			if vim.api.nvim_get_mode().mode == "n" then
				vim.lsp.buf.format({ async = true })
			else
				local start_pos = get_mark(buffer, "<")
				local end_pos = get_mark(buffer, ">")
				vim.lsp.buf.format({ range = { start_pos, end_pos } })
			end
		end,
		buffer = buffer,
		modes = { "n", "v" },
		description = "Format Buffer/Region",
	})
end

local function update_capabilities(client, flags)
	local rc = client.server_capabilities
	if flags.formatting == false then
		rc.document_formatting = false
		rc.document_range_formatting = false
	end
end

M.build = function(flags)
	flags = flags or {}
	vim.validate({
		formatting = { flags.formatting, { "boolean", "nil" } },
	})
	flags = vim.tbl_extend("force", { formatting = true }, flags)
	return function(client, buffer)
		update_capabilities(client, flags)
		add_mappings(buffer)
	end
end

return M
