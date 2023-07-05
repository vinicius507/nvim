return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				update_in_insert = true,
			},
			---@type lspconfig.options
			servers = {
				lua_ls = {},
				nil_ls = {},
				vimls = {},
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")

			opts.on_attach = function(client)
				client.offset_encoding = "utf-16"
			end
			opts.sources = vim.list_extend(opts.sources, {
				nls.builtins.diagnostics.eslint,

				nls.builtins.formatting.black,
				nls.builtins.formatting.isort,
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.prettier,
				nls.builtins.formatting.alejandra,

				nls.builtins.code_actions.gitsigns,
			})
		end,
	},
	{ "mason.nvim", enabled = false },
	{ "mason-lspconfig.nvim", enabled = false },
}
