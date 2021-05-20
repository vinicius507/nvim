local lualine = require('lualine')
local components = require('md-lualine.components')

lualine.setup{
	options = {
		theme = 'tokyonight',
		section_separators = { '', '' },
		component_separators = { '', '' },
		disabled_filetypes = { },
		icons_enabled = true,
	},
	sections = {
		lualine_a = { {'mode', upper = true} },
		lualine_b = {
			{
				'branch',
				icon = ''
			},
		},
		lualine_c = {
			{
				'filename',
				file_status = false,
			},
			{
				'diagnostics',
				sources = { 'nvim_lsp' },
				sections = { 'error', 'warn', 'info' },
				symbols = { error = ' ', warn = ' ', info= ' ' },
			},
		},
		lualine_x = {  },
		lualine_y = {
			components.filetype,
		},
		lualine_z = { 'progress' },
	},
	inactive_sections = {
		lualine_a = { components.filetype },
		lualine_b = {
			{
				'filename',
				file_status = false,
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = { 'nvim-tree' }
}
