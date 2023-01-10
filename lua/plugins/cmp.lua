return {
	"hrsh7th/nvim-cmp",
	---@param opts cmp.ConfigSchema
	opts = function(_, opts)
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local remap = require("config.keymaps").remap

		opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }, 0, #opts.sources))
		opts.formatting.fields = { "abbr", "kind" }
		opts.formatting.format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })

			kind.kind = strings[1]

			return kind
		end
		opts.mapping = {
			["<Return>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm()
				else
					fallback()
				end
			end),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					local entry = cmp.get_selected_entry()
					if not entry then
						cmp.select_next_item()
					else
						cmp.confirm()
					end
				elseif luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}
		opts.view = {
			entries = {
				name = "custom",
				selection_order = "near_cursor",
			},
		}

		remap("<C-Space>", function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				cmp.complete()
			end
		end, {
			modes = { "i", "s" },
			description = "Open/cycle autocomplete",
		})
	end,
	dependencies = {
		"hrsh7th/cmp-emoji",
		"onsails/lspkind.nvim",
	},
}
