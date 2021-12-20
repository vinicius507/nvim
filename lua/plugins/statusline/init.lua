local ok, lualine = pcall(require, 'lualine')

if not ok then
	return
end

local components = require('plugins.statusline.components')

lualine.setup({
	options = {
		theme = 'nord',
		section_separators = { '', '' },
		component_separators = { '', '' },
		disabled_filetypes = {},
		icons_enabled = true,
	},
	sections = {
		lualine_a = { { 'mode', upper = true } },
		lualine_b = {
			components.filetype,
		},
		lualine_c = {
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				sections = { 'error', 'warn', 'info' },
				symbols = { error = ' ', warn = ' ', info = ' ' },
			},
		},
		lualine_x = {},
		lualine_y = {
			{
				'branch',
				icon = '',
			},
		},
		lualine_z = { 'progress' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { components.filetype },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{
				'branch',
				icon = '',
			},
		},
		lualine_z = {},
	},
	extensions = {
		'nvim-tree',
		'toggleterm',
	},
})
