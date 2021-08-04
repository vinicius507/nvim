local vimg = vim.g

local map = function(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader
vimg.mapleader = ' '

-- Session
map('n', '<leader>Ss', '<cmd>SessionSave<CR>')
map('n', '<leader>Sl', '<cmd>SessionLoad<CR>')

-- Buffer Keys
map('n', '<C-h>', ':wincmd h<CR>')
map('n', '<C-j>', ':wincmd j<CR>')
map('n', '<C-k>', ':wincmd k<CR>')
map('n', '<C-l>', ':wincmd l<CR>')

map('n', '<Leader>q', '<cmd>bdelete!<CR>')

-- LSP Keys
map(
	'n',
	'<Leader>gd',
	'<cmd>lua require("nvim-treesitter-refactor.navigation").goto_definition_lsp_fallback(0)<CR>'
)
map(
	'n',
	'<Leader>gc',
	'<cmd>TSTextobjectPeekDefinitionCode @function.outer<CR>'
)
map('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<Leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map(
	'n',
	'<Leader>gl',
	'<cmd>lua require("nvim-treesitter-refactor.navigation").list_definitions(0)<CR>'
)
map(
	'n',
	'<Leader>gO',
	'<cmd>lua require("nvim-treesitter-refactor.navigation").list_definitions_toc(0)<CR>'
)
map('n', '<C-n>', '<cmd>lua vim.lsp.buf.goto_next()<CR>')
map('n', '<C-p>', '<cmd>lua vim.lsp.buf.goto_prev()<CR>')
map('n', '<C-d>', '<cmd>lua vim.lsp.buf.show_line_diagnostics()<CR>')

-- LSP Trouble Keys
map('n', '<leader>xx', '<cmd>LspTroubleToggle<CR>')
map('n', '<leader>xw', '<cmd>LspTroubleToggle lsp_workspace_diagnostics<CR>')
map('n', '<leader>xd', '<cmd>LspTroubleToggle lsp_document_diagnostics<CR>')
map('n', '<leader>xl', '<cmd>LspTroubleToggle loclist<CR>')
map('n', '<leader>xq', '<cmd>LspTroubleToggle quickfix<CR>')
map('n', '<Leader>gr', '<cmd>LspTrouble lsp_references<CR>')

-- TODO: Comments Keys
map('n', '<Leader>xt', '<cmd>TodoTrouble<CR>')

-- LSP Saga
map('n', '<leader>gh', '<cmd>Lspsaga hover_doc<CR>')
map('n', '<leader>sa', '<cmd>Lspsaga code_action<CR>')
map('n', '<leader>sr', '<cmd>Lspsaga rename<CR>')

-- Compe Keys
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t('<C-n>')
	else
		return t('<Tab>')
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t('<C-p>')
	else
		return t('<S-Tab>')
	end
end

map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('i', '<C-Space>', 'compe#complete()', { expr = true })
map('i', '<CR>', 'compe#confirm("<CR>")', { expr = true })

-- Telescope Keys
map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
map('n', '<Leader>fh', '<cmd>Telescope oldfiles<CR>')
map('n', '<Leader>fl', '<cmd>Telescope lsp_workspace_symbols<CR>')
map('n', '<Leader>fGg', '<cmd>Telescope git_commits<CR>')
map('n', '<Leader>fGc', '<cmd>Telescope git_bcommits<CR>')
map('n', '<Leader>fGb', '<cmd>Telescope git_branches<CR>')
map('n', '<Leader>fGs', '<cmd>Telescope git_status<CR>')

-- Nvim-tree
map('n', '<Leader><Tab>', '<cmd>NvimTreeToggle<CR>')
map('n', '<Leader>nr', '<cmd>NvimTreeRefresh<CR>')
map('n', '<Leader>nf', '<cmd>NvimTreeFindFile<CR>')

-- Dap
map('n', '<Leader>tb', "<cmd>lua require('dap').toggle_breakpoint()<CR>")
map(
	'n',
	'<Leader>tB',
	"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"
)
map('n', '<Leader>tc', ':DebugC ')
map('n', '<Leader>tr', ':DebugRust ')

-- Diffview
map('n', '<Leader>do', '<cmd>DiffviewOpen -uno<CR>')
map('n', '<Leader>dq', '<cmd>DiffviewClose<CR>')
map('n', '<Leader>dr', '<cmd>DiffviewRefresh<CR>')

-- Neogit
map('n', '<Leader>G', '<cmd>Neogit kind=floating<CR>')

-- 42 Header
map('n', '<F2>', ':Stdheader<CR>')
