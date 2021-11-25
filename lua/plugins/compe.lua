local ok, cmp = pcall(require, 'cmp')

if not ok then
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			local ok_s, luasnip = pcall(require, 'luasnip')

			if not ok_s then
				error('[CMP] Luasnip could not be loaded')
				return
			end

			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format(
				'%s %s',
				require('plugins.others').lspkind[vim_item.kind],
				vim_item.kind
			)

			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				nvim_lua = '[Lua]',
				buffer = '[BUF]',
			})[entry.source.name]

			return vim_item
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'calc' },
		{ name = 'orgmode' },
		{ name = 'luasnip' },
	},
})
