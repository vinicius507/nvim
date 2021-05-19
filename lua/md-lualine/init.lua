local lualine = require('lualine')

local filename = function()
	local ok, devicons = pcall(require, 'nvim-web-devicons')
	if ok then
		local f_name, f_extension = vim.fn.expand('%:t'), vim.fn.expand('%:e')
		local icon = devicons.get_icon(f_name, f_extension) or ''
		local title = ' '
		if f_name == '' then
			title = title .. '[No Name]'
		else
			title = title .. f_name
		end
		return icon .. title
	else
		ok = vim.fn.exists('*WebDevIconsGetFileTypeSymbol')
		if ok ~= 0 then return vim.fn.WebDevIconsGetFileTypeSymbol() end
	end
end

lualine.setup{
	options = {
		theme = 'onedark',
		section_separators = { '', '' },
		component_separators = { '', '' },
		disabled_filetypes = { },
		icons_enabled = true,
	},
	sections = {
		lualine_a = { {'mode', upper = true} },
		lualine_b = {
			filename,
			{
				'diagnostics',
				sources = { 'nvim_lsp' },
				sections = { 'error', 'warn', 'info' },
				symbols = {error = ' ', warn = ' ', info= ' '},
			},
		},
		lualine_c = {
		},
		lualine_x = {  },
		lualine_y = {
			{
				'branch',
				icon = ''
			},
		},
		lualine_z = { 'progress' },
	},
	inactive_sections = {
		lualine_a = { filename },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = { 'nvim-tree' }
}
