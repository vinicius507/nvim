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

	project_nvim.setup()
end

M.header42 = function()
	local ok, header = pcall(require, 'header42')

	if not ok then
		return
	end

	header.setup({
		user = 'vgoncalv',
		mail = 'vgoncalv@student.42sp.org.br',
		ft = {
			go = {
				user = 'vini',
				mail = 'vini@42sp.org.br',
				start_comment = '/*',
				end_comment = '*/',
				fill_comment = '*',
			},
			python = {
				user = 'vini',
				mail = 'vini@42sp.org.br',
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

M.orgmode = function()
	local ok1, org = pcall(require, 'orgmode')

	if not ok1 then
		return
	end

	org.setup({
		org_agenda_files = { '~/Documents/org/**/*' },
		org_default_notes_file = '~/Documents/org/notes.org',
	})

	local ok2, bullets = pcall(require, 'org-bullets')

	if not ok2 then
		return
	end

	bullets.setup({
		symbols = { '◉', '○', '✸', '✿' },
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

M.asdf = function()
	local ok, asdf = pcall(require, 'asdf-nvim')

	if not ok then
		return
	end

	asdf.setup()
end

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
