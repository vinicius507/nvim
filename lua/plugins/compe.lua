local ok, cmp = pcall(require, 'cmp')

if not ok then
	return
end

local snip_ok, luasnip = pcall(require, 'luasnip')

cmp.setup({
	snippet = {
		expand = function(args)
			if not snip_ok then
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
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif snip_ok and luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {
			'i',
			's',
		}),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			'i',
			's',
		}),
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
