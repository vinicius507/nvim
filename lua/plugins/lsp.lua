return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			---@type lspconfig.options
			servers = {
				bashls = {},
				clangd = {
					on_new_config = function(config, _)
						config.capabilities = vim.tbl_deep_extend("force", config.capabilities, {
							offsetEncoding = "utf-16",
						})
					end,
					on_attach = function(client)
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end,
				},
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

			opts.on_attach = function(client)
				client.offset_encoding = "utf-16"
			end
			opts.sources = vim.list_extend(opts.sources, {
				nls.builtins.formatting.black,
				nls.builtins.formatting.isort,
				nls.builtins.formatting.stylua,

				nls.builtins.code_actions.gitsigns,
			}, 0, #opts.sources)
		end,
	},
}
