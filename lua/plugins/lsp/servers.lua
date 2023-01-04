---@type lspconfig.options
return {
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
}
