local null_ls = require("null-ls")
local mappings = require("mappings")

null_ls.setup({
	on_attach = function(_, bufnr)
		local get_mark = vim.api.nvim_buf_get_mark
		mappings.add({
			"<Leader>cf",
			function()
				if vim.api.nvim_get_mode().mode == "n" then
					vim.lsp.buf.formatting()
				else
					local start_pos = get_mark(bufnr, "<")
					local end_pos = get_mark(bufnr, ">")
					vim.lsp.buf.range_formatting({}, start_pos, end_pos)
				end
			end,
			buffer = bufnr,
			modes = { "n", "v" },
			description = "Format Buffer/Region",
		})
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})
