local ok, ts_config = pcall(require, 'nvim-treesitter.configs')

if not ok then
	return
end

ts_config.setup({
	ensure_installed = {
		'c',
		'cpp',
		'python',
		'typescript',
		'javascript',
		'lua',
		'json',
		'css',
		'bash',
		'tsx',
		'html',
		'dockerfile',
		'cmake',
		'go',
		'toml',
		'yaml',
		'comment',
	},
	highlight = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		lsp_interop = {
			enable = true,
			peek_definition_code = {
				['<leader>gc'] = '@function.outer',
			},
		},
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },
		smart_rename = { enable = false },
		navigation = {
			enable = true,
			keymaps = {
				goto_definition_lsp_fallback = '<leader>gd',
				list_definitions = '<leader>gl',
				list_definitions_toc = '<leader>gO',
				goto_next_usage = '<a-=>',
				goto_previous_usage = '<a-->',
			},
		},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	},
})
