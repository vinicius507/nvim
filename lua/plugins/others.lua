local M = {}

M.lsptrouble = function()
	local ok, trouble = pcall(require, 'trouble')

	if not ok then
		return
	end

	trouble.setup()
end

M.project_nvim = function()
	local ok, project_nvim = pcall(require, 'project_nvim')

	if not ok then
		return
	end

	project_nvim.setup({
		show_hidden = true,
	})
end

M.header42 = function()
	local ok, header = pcall(require, 'header42')

	if not ok then
		return
	end

	header.setup({
		intra_login = 'vgoncalv',
		intra_mail = 'vgoncalv@student.42sp.org.br',
		ft = {
			go = {
				intra_login = 'vini',
				intra_mail = 'vini@42sp.org.br',
				start_comment = '/*',
				end_comment = '*/',
				fill_comment = '*',
			},
			python = {
				intra_login = 'vini',
				intra_mail = 'vini@42sp.org.br',
			},
			sh = {
				start_comment = '#',
				fill_comment = '*',
				end_comment = '#',
			},
		},
	})
end

M.gitsigns = function()
	local ok, signs = pcall(require, 'gitsigns')

	if not ok then
		return
	end

	signs.setup({
		current_line_blame = true,
	})
end

M.colorizer = function()
	local ok, colorizer = pcall(require, 'colorizer')

	if not ok then
		return
	end

	colorizer.setup({
		'lua',
		'css',
		'scss',
		'javascript',
		'typescript',
		'javascriptreact',
		'typescriptreact',
		'json',
		html = {
			mode = 'foreground',
		},
	})
end

M.lspkind = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = 'ﰠ',
	Variable = '',
	Class = 'ﴯ',
	Interface = '',
	Module = '',
	Property = 'ﰠ',
	Unit = '塞',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = 'פּ',
	Event = '',
	Operator = '',
	TypeParameter = '',
}

M.autopairs = function()
	local ok, npairs = pcall(require, 'nvim-autopairs')

	if not ok then
		return
	end

	npairs.setup({
		disable_filetype = { 'TelescopePrompt', 'vim' },
	})
end

return M
