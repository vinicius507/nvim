return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp = require("lspconfig")
			local servers = require("plugins.lsp.servers")

			require("mason").setup()
			require("mason-lspconfig").setup()

			require("neodev").setup()

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local buffer = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local format = require("plugins.lsp.format")
					local keymaps = require("plugins.lsp.keymaps")

					format.on_attach(client, buffer)
					keymaps.on_attach(client, buffer)
				end,
			})

			for server, config in pairs(servers) do
				lsp[server].setup(config)
			end
		end,
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"b0o/SchemaStore.nvim",
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local nls = require("null-ls")

			nls.setup({
				sources = {
					-- Python
					nls.builtins.formatting.black,
					nls.builtins.formatting.isort,

					-- Lua
					nls.builtins.formatting.stylua,

					-- Gitsigns
					nls.builtins.code_actions.gitsigns,
				},
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
