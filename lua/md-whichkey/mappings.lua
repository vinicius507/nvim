local whichkey = require('which-key')

local leader = {
	['1'] = 'which_key_ignore',
	['2'] = 'which_key_ignore',
	['3'] = 'which_key_ignore',
	['4'] = 'which_key_ignore',
	['5'] = 'which_key_ignore',
	['6'] = 'which_key_ignore',
	['7'] = 'which_key_ignore',
	['8'] = 'which_key_ignore',
	['9'] = 'which_key_ignore',
	['<Tab>'] = { '<cmd>NvimTreeToggle<CR>', 'file explorer' },
	d = {
		name = 'diffview',
		o = { '<cmd>DiffviewOpen<CR>', 'open' },
		q = { '<cmd>DiffviewClose<CR>', 'close' },
		r = { '<cmd>DiffviewRefresh<CR>', 'refresh' },
	},
	f = {
		name = 'telescope',
		f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", 'files' },
		g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", 'grep' },
		h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", 'help tags' },
		G = {
			name = 'git',
			g = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", 'commits' },
			c = { "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", 'bcommits' },
			b = { "<cmd>lua require('telescope.builtin').git_branches()<CR>", 'branches' },
			s = { "<cmd>lua require('telescope.builtin').git_status()<CR>", 'status' },
		},
	},
	g = {
		name = 'lsp',
		d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'definition' },
		D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration' },
		h = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'hover' },
		i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation' },
		r = { '<cmd>LspTrouble lsp_references<cr>', 'references' },
		s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature help' },
	},
	n = {
		name = 'nvim-tree',
		r = { '<cmd>NvimTreeRefresh<CR>', 'refresh' },
		f = { '<cmd>NvimTreeFindFile<CR>', 'find' },
	},
	q = { '<cmd>bdelete!<CR>', 'kill buffer' },
	t = { '<cmd>TodoTrouble<CR>', 'todo' },
	x = {
		name = 'trouble',
		d = { '<cmd>LspTroubleToggle lsp_document_diagnostics<CR>', 'document' },
		l = { '<cmd>LspTroubleToggle loclist<CR>', 'loclist' },
		q = { '<cmd>LspTroubleToggle quickfix<CR>', 'quickfix' },
		w = { '<cmd>LspTroubleToggle lsp_workspace_diagnostics<CR>', 'worskpace' },
		x = { '<cmd>LspTroubleToggle<CR>', 'toggle' },
	},
}

whichkey.register(leader, { prefix = '<Leader>' })
