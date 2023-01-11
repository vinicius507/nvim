return {
	"hrsh7th/nvim-cmp",
	---@param opts cmp.ConfigSchema
	opts = function(_, opts)
		local cmp = require("cmp")

		opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }, 0, #opts.sources))
		opts.formatting.fields = { "abbr", "kind" }
		opts.formatting.format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })

			kind.kind = strings[1]

			return kind
		end
		opts.view = {
			entries = {
				name = "custom",
				selection_order = "near_cursor",
			},
		}
	end,
	dependencies = {
		"hrsh7th/cmp-emoji",
		"onsails/lspkind.nvim",
	},
}
