local ok1, telescope = pcall(require, 'telescope')

if not ok1 then
	return
end

local ok2, trouble = pcall(require, 'trouble.providers.telescope')

telescope.setup({
	defaults = {
		prompt_prefix = '  ',
		selection_caret = ' ',
		color_devicons = true,
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
