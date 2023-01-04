local M = {}

local remap = require("myriad.keymaps").remap

function M.on_attach(client, buffer)
	if client.supports_method("textDocument/formatting") then
		remap("<Leader>cf", function()
			local get_mark = vim.api.nvim_buf_get_mark

			if vim.api.nvim_get_mode().mode == "n" then
				vim.lsp.buf.format({ async = true })
			else
				local start_pos = get_mark(buffer, "<")
				local end_pos = get_mark(buffer, ">")

				vim.lsp.buf.format({ range = { start_pos, end_pos } })
			end
		end, {
			buffer = buffer,
			modes = { "n", "v" },
			desc = "Format Buffer/Region",
		})
	end
end

return M
