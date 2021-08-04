local M = {}

M.lsptrouble = function()
	local ok, trouble = pcall(require, 'trouble')

	if not ok then
		return
	end

	trouble.setup()
end

M.lsprooter = function()
	local ok, rooter = pcall(require, 'lsp-rooter')

	if not ok then
		return
	end

	rooter.setup()
end

M.norme = function()
	local ok, norme = pcall(require, 'norme')

	if not ok then
		return
	end

	norme.setup()
end

M.header42 = function()
	local ok, header = pcall(require, 'header42')

	if not ok then
		return
	end

	header.user = 'vgocalv'
	header.mail = '@student.42sp.org.br'
end

M.gitsigns = function()
	local ok, signs = pcall(require, 'gitsigns')

	if not ok then
		return
	end

	signs.setup()
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

return M
