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
map('n', '<Leader>1', '<cmd>BufferLineGoToBuffer 1<CR>')
map('n', '<Leader>2', '<cmd>BufferLineGoToBuffer 2<CR>')
map('n', '<Leader>3', '<cmd>BufferLineGoToBuffer 3<CR>')
map('n', '<Leader>4', '<cmd>BufferLineGoToBuffer 4<CR>')
map('n', '<Leader>5', '<cmd>BufferLineGoToBuffer 5<CR>')
map('n', '<Leader>6', '<cmd>BufferLineGoToBuffer 6<CR>')
map('n', '<Leader>7', '<cmd>BufferLineGoToBuffer 7<CR>')
map('n', '<Leader>8', '<cmd>BufferLineGoToBuffer 8<CR>')
map('n', '<Leader>9', '<cmd>BufferLineGoToBuffer 9<CR>')
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
map(
	'n',
	'<C-n>',
	'<cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>'
)
map(
	'n',
	'<C-p>',
	'<cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>'
)

-- Git signs
map('n', '<Leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
map('n', '<Leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
map('n', '<Leader>hU', '<cmd>Gitsigns unstage_buffer<CR>')
map('n', '<Leader>hb', '<cmd>Gitsigns blame_line<CR>')
map('n', '<Leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
map('n', '<Leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
map('n', '<Leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
map('n', '<Leader>hu', '<cmd>Gitsigns unstage_hunk<CR>')

-- LSP Trouble Keys
map('n', '<leader>xx', '<cmd>TroubleToggle<CR>')
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>')
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>')
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<CR>')
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>')
map('n', '<Leader>gr', '<cmd>Trouble lsp_references<CR>')

-- TODO: Comments Keys
map('n', '<Leader>xt', '<cmd>TodoTrouble<CR>')

-- LSP Saga
map('n', '<leader>gh', '<cmd>Lspsaga hover_doc<CR>')
map('n', '<leader>sa', '<cmd>Lspsaga code_action<CR>')
map('n', '<leader>sr', '<cmd>Lspsaga rename<CR>')

-- Telescope Keys
map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
map('n', '<Leader>fh', '<cmd>Telescope oldfiles<CR>')
map('n', '<Leader>fl', '<cmd>Telescope lsp_workspace_symbols<CR>')
map('n', '<Leader>fp', '<cmd>Telescope projects<CR>')
map('n', '<Leader>fGb', '<cmd>Telescope git_branches<CR>')
map('n', '<Leader>fGc', '<cmd>Telescope git_bcommits<CR>')
map('n', '<Leader>fGg', '<cmd>Telescope git_commits<CR>')
map('n', '<Leader>fGs', '<cmd>Telescope git_status<CR>')

-- Nvim-tree
map('n', '<Leader><Tab>', '<cmd>NvimTreeToggle<CR>')
map('n', '<Leader>nr', '<cmd>NvimTreeRefresh<CR>')
map('n', '<Leader>nf', '<cmd>NvimTreeFindFile<CR>')

-- Dap
map('n', '<Leader>tb', '<cmd>DapSetBreakpoint<CR>')
map('n', '<Leader>tB', '<cmd>DapSetConditionalBreakpoint<CR>')
map('n', '<Leader>td', '<cmd>DapContinue<CR>')
map('n', '<Leader>to', '<cmd>DapReplOpen<CR>')

-- Diffview
map('n', '<Leader>do', '<cmd>DiffviewOpen -uno<CR>')
map('n', '<Leader>dq', '<cmd>DiffviewClose<CR>')
map('n', '<Leader>dr', '<cmd>DiffviewRefresh<CR>')

-- Neogit
map('n', '<Leader>G', '<cmd>Neogit<CR>')

-- 42 Header
map('n', '<F2>', ':Stdheader<CR>')

-- Make Run terminal
map('n', '<F5>', ':MakeRun<CR>')

-- Get TS hl-group
map('n', '<F10>', '<cmd>TSHighlightCapturesUnderCursor<CR>')

-- Hacks by ThePrimeagen
-- Better Cursor positioning in search
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
-- Better cursor positioning while joining lines
map('n', 'J', 'mzJ`z')
-- Undo breakpoints
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', '!', '!<C-g>u')
map('i', '?', '?<C-g>u')
-- Moving Text
map('v', '>', '>gv')
map('v', '<', '<gv')
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('i', '<C-j>', '<esc>:m .+1<CR>==a')
map('i', '<C-k>', '<esc>:m .-2<CR>==a')
