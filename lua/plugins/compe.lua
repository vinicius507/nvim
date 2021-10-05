local ok, cmp = pcall(require, 'cmp')

if not ok then
	return
end

cmp.setup({
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
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'calc' },
		{ name = 'orgmode' },
	},
})
