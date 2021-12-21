local ok1, telescope = pcall(require, 'telescope')

if not ok1 then
	return
end

local ok2, trouble = pcall(require, 'trouble.providers.telescope')

telescope.setup({
	defaults = {
		prompt_prefix = '  ',
		selection_caret = ' ',
		entry_prefix = '  ',
		color_devicons = true,
		layout_config = {
			horizontal = {
				prompt_position = 'bottom',
				preview_width = 0.55,
				results_with = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		path_display = { 'truncate' },
		set_env = { COLORTERM = 'truecolor' },
		mappings = {
			i = {
				['<C-x>'] = false,
				['<C-q>'] = ok2 and trouble.open_with_trouble or nil,
			},
			n = {
				['<C-q>'] = ok2 and trouble.open_with_trouble or nil,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

telescope.load_extension('fzy_native')
telescope.load_extension('projects')
