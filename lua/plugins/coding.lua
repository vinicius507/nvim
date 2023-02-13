return {
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"danymat/neogen",
		lazy = false,
		keys = {
			{
				"<Leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Comment Annotation",
			},
		},
		opts = {
			snippet_engine = "luasnip",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<Leader>cr",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				desc = "Refactor",
			},
		},
		opts = function()
			local ftopts = {
				c = true,
				h = true,
				cpp = true,
				hpp = true,
				cxx = true,

				go = true,
			}

			return {
				prompt_func_return_type = ftopts,
				prompt_func_param_type = ftopts,
			}
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local cmp = require("cmp")
			local neogen = require("neogen")

			opts.window = {
				completion = {
					col_offset = -3,
					side_padding = 0,
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				},
			}
			opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
				{ name = "emoji" },
				{ name = "neorg" },
			}, 0, #opts.sources))
			opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
				if neogen.jumpable() then
					neogen.jump_next()
				else
					fallback()
				end
			end)
			opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
				if neogen.jumpable() then
					neogen.jump_prev()
				else
					fallback()
				end
			end)
			opts.formatting.fields = {
				cmp.ItemField.Kind,
				cmp.ItemField.Abbr,
				cmp.ItemField.Menu,
			}
			---@param entry cmp.Entry
			---@param vim_item vim.CompletedItem
			opts.formatting.format = function(entry, vim_item)
				local item = require("lspkind").cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
				})(entry, vim_item)

				item.kind = string.format(" %s ", vim.split(item.kind, "%s", { trimempty = true })[1])

				return item
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
	},
}
