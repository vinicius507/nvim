local M = {}
local mappings = require("mappings")

local function add_mappings(buffer, rc)
	if rc.hover then
		mappings.add({ "K", vim.lsp.buf.hover, buffer = buffer, description = "Hover" })
	end
	if rc.implementation then
		mappings.add({ "gi", vim.lsp.buf.implementation, buffer = buffer, "Goto implementation" })
	end
	if rc.find_references then
		mappings.add({ "gr", vim.lsp.buf.references, buffer = buffer, description = "Goto references" })
	end
	if rc.goto_definition then
		mappings.add({ "gd", vim.lsp.buf.definition, buffer = buffer, description = "Goto definition" })
	end
	if rc.declaration then
		mappings.add({ "gD", vim.lsp.buf.declaration, buffer = buffer, description = "Goto declaration" })
	end
	if rc.type_definition then
		mappings.add({ "gt", vim.lsp.buf.type_definition, buffer = buffer, description = "Goto type definition" })
	end
	if rc.signature_help then
		mappings.add({
			"<C-k>",
			vim.lsp.buf.signature_help,
			buffer = buffer,
			modes = "i",
			description = "Signature help",
		})
	end
	if rc.rename then
		mappings.add({ "<Leader>cr", vim.lsp.buf.rename, buffer = buffer, description = "Rename" })
	end
	if rc.code_action.codeActionKinds ~= nil then
		mappings.add({ "<Leader>ca", vim.lsp.buf.code_action, buffer = buffer, description = "Code actions" })
	end
	if rc.document_formatting then
		local formatting_cb
		if rc.document_range_formatting then
			formatting_cb = function()
				local get_mark = vim.api.nvim_buf_get_mark
				if vim.api.nvim_get_mode().mode == "n" then
					vim.lsp.buf.formatting()
				else
					local start_pos = get_mark(buffer, "<")
					local end_pos = get_mark(buffer, ">")
					vim.lsp.buf.range_formatting({}, start_pos, end_pos)
				end
			end
		else
			formatting_cb = vim.lsp.buf.formatting
		end
		mappings.add({
			"<Leader>cf",
			formatting_cb,
			buffer = buffer,
			modes = { "n", "v" },
			description = "Format Buffer/Region",
		})
	end
end

local function update_capabilities(client, flags)
	local rc = client.resolved_capabilities
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
		add_mappings(buffer, client.resolved_capabilities)
	end
end

return M
