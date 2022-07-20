local cmp = require("cmp")
local luasnip = require("luasnip")
local mappings = require("mappings")

cmp.setup({
	enabled = function()
		local context = require("cmp.config.context")
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			local in_comment = context.in_syntax_group("Comment")
			local in_tscomment = context.in_treesitter_capture("comment")
			return not (in_comment or in_tscomment)
		end
	end,
	view = { entries = { name = "custom", selection_order = "near_cursor" } },
	formatting = {
		fields = { "kind", "abbr" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = strings[1]
			return kind
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
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
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
	},
})

mappings.add({
	"<C-Space>",
	function()
		if cmp.visible() then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		else
			cmp.complete()
		end
	end,
	modes = { "i", "s" },
	description = "Open/cycle autocomplete",
})
