return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			---@type lspconfig.options
			servers = {
				bashls = {},
				clangd = {},
				dockerls = {},
				jsonls = {
					on_new_config = function(new_config)
						new_config.settings.json.schemas = new_config.settings.json.schemas or {}
						vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
					end,
					settings = {
						json = {
							format = { enable = true },
							validate = { enable = true },
						},
					},
				},
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
				sumneko_lua = {
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
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")

			opts.sources = vim.list_extend(opts.sources, {
				nls.builtins.formatting.black,
				nls.builtins.formatting.stylua,

				nls.builtins.code_actions.gitsigns,
			}, 0, #opts.sources)
		end,
	},
}
