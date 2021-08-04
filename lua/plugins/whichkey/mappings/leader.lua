local M = {}

M.map = {
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
	a = {
		'<cmd>TSTextobjectSwapNext @parameter.inner<CR>',
		'swap next function parameter',
	},
	A = {
		'<cmd>TSTextobjectSwapPrevious @parameter.inner<CR>',
		'swap previous function parameter',
	},
	d = {
		name = 'diffview',
		o = { '<cmd>DiffviewOpen -uno<CR>', 'open' },
		q = { '<cmd>DiffviewClose<CR>', 'close' },
		r = { '<cmd>DiffviewRefresh<CR>', 'refresh' },
	},
	f = {
		name = 'telescope',
		f = { '<cmd>Telescope find_files<CR>', 'files' },
		g = { '<cmd>Telescope live_grep<CR>', 'grep' },
		h = { '<cmd>Telescope oldfiles<CR>', 'history' },
		l = {
			'<cmd>Telescope lsp_workspace_symbols<CR>',
			'lsp symbols',
		},
		G = {
			name = 'git',
			g = {
				'<cmd>Telescope git_commits<CR>',
				'commits',
			},
			c = {
				'<cmd>Telescope git_bcommits<CR>',
				'bcommits',
			},
			b = {
				'<cmd>Telescope git_branches<CR>',
				'branches',
			},
			s = {
				'<cmd>Telescope git_status<CR>',
				'status',
			},
		},
	},
	g = {
		name = 'lsp',
		c = {
			'<cmd>TSTextobjectPeekDefinitionCode @function.outer<CR>',
			'peek definition code',
		},
		d = {
			'<cmd>lua require("nvim-treesitter-refactor.navigation").goto_definition_lsp_fallback(0)<CR>',
			'definition',
		},
		D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration' },
		O = {
			'<cmd>lua require("nvim-treesitter-refactor.navigation").list_definitions_toc(0)<CR>',
			'list definitions in table',
		},
		h = { '<cmd>Lspsaga hover_doc<CR>', 'info' },
		i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation' },
		l = {
			'<cmd>lua require("nvim-treesitter-refactor.navigation").list_definitions(0)<CR>',
			'list definitions',
		},
		r = { '<cmd>LspTrouble lsp_references<CR>', 'references' },
		s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature help' },
	},
	G = { '<cmd>Neogit<CR>', 'neogit' },
	h = {
		name = 'git signs',
		b = { "<cmd>lua require('gitsigns').blame_line(true)", 'blame line' },
		p = { "<cmd>lua require('gitsigns').preview_hunk()", 'preview hunk' },
		r = { "<cmd>lua require('gitsigns').reset_hunk()", 'reset hunk' },
		R = { "<cmd>lua require('gitsigns').reset_buffer()", 'reset buffer' },
		s = { "<cmd>lua require('gitsigns').stage_hunk()", 'stage hunk' },
		S = { "<cmd>lua require('gitsigns').stage_buffer()", 'stage buffer' },
		u = { "<cmd>lua require('gitsigns').undo_stage_hunk()", 'unstage hunk' },
		U = {
			"<cmd>lua require('gitsigns').reset_buffer_index()",
			'unstage buffer',
		},
	},
	n = {
		name = 'nvim-tree',
		r = { '<cmd>NvimTreeRefresh<CR>', 'refresh' },
		f = { '<cmd>NvimTreeFindFile<CR>', 'find' },
	},
	o = {
		name = 'orgmode',
		a = 'agenda',
		c = 'capture',
	},
	q = { '<cmd>bdelete!<CR>', 'kill buffer' },
	s = {
		name = 'saga',
		a = { '<cmd>Lspsaga code_action<CR>', 'code actions' },
		r = { '<cmd>Lspsaga rename<CR>', 'rename' },
	},
	S = {
		name = 'session',
		s = { '<cmd>SessionSave<CR>', 'save session' },
		l = { '<cmd>SessionLoad<CR>', 'load session' },
	},
	t = {
		name = 'dap',
		b = {
			"<cmd>lua require('dap').toggle_breakpoint()<CR>",
			'toggle breakpoint',
		},
		B = {
			"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			'set conditional breakpoint',
		},
		c = { ':DebugC ', 'debug c project' },
		r = { ':DebugRust ', 'debug rust project' },
	},
	x = {
		name = 'trouble',
		d = { '<cmd>LspTroubleToggle lsp_document_diagnostics<CR>', 'document' },
		l = { '<cmd>LspTroubleToggle loclist<CR>', 'loclist' },
		q = { '<cmd>LspTroubleToggle quickfix<CR>', 'quickfix' },
		t = { '<cmd>TodoTrouble<CR>', 'todo' },
		w = { '<cmd>LspTroubleToggle lsp_workspace_diagnostics<CR>', 'worskpace' },
		x = { '<cmd>LspTroubleToggle<CR>', 'toggle' },
	},
}

M.prefix = '<Leader>'

return M
