local null_ls = require("null-ls")
local mappings = require("mappings")

null_ls.setup({
	on_attach = function(_, buffer)
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
	end,
	sources = {
		-- Python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		-- Lua
		null_ls.builtins.formatting.stylua,
	},
})
