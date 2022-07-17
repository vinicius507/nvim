local null_ls = require("null-ls")
local map = require("which-key").register

null_ls.setup({
	on_attach = function(client, bufnr)
		local mappings = {
			name = "Code",
			f = {
				vim.lsp.buf.formatting,
				"Format Buffer",
			},
		}
		local visual_mappings = {
			name = "Code",
			f = {
				vim.lsp.buf.formatting,
				"Format Region",
			},
		}
		map(mappings, { prefix = "<Leader>c", buffer = bufnr })
		map(visual_mappings, { mode = "v", prefix = "<Leader>c", buffer = bufnr })
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})
