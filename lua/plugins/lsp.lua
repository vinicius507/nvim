return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				update_in_insert = true,
			},
			---@type lspconfig.options
			servers = {
				astro = {},
				bashls = {},
				clangd = {},
				dockerls = {},
				pylsp = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = true },
							checkOnSave = {
								command = "clippy",
								extraArgs = { "--no-deps" },
							},
						},
					},
				},
				yamlls = {},
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							completion = { callSnippet = "Replace" },
							format = { enable = false },
						},
					},
				},
				vimls = {},
			},
			setup = {
				clangd = function(_, opts)
					opts.capabilities.offsetEncoding = { "utf-16" }
				end,
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
				nls.builtins.formatting.prettierd,

				nls.builtins.code_actions.gitsigns,
			}, 0, #opts.sources)
		end,
	},
	{ "mason-lspconfig.nvim", enabled = false },
}
