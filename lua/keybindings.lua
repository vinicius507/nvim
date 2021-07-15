local vimg = vim.g
local map = vim.api.nvim_set_keymap
-- local bmap = vim.api.nvim_buf_set_keymap -- should I ever need it

-- Leader
vimg.mapleader = " "

-- Session
map('n', '<leader>Ss', '<cmd>SessionSave<CR>', {silent = true, noremap = true})
map('n', '<leader>Sl', '<cmd>SessionLoad<CR>', {silent = true, noremap = true})

-- Buffer Keys
map('n', '<C-h>', ':wincmd h<CR>', {silent = true, noremap = true})
map('n', '<C-j>', ':wincmd j<CR>', {silent = true, noremap = true})
map('n', '<C-k>', ':wincmd k<CR>', {silent = true, noremap = true})
map('n', '<C-l>', ':wincmd l<CR>', {silent = true, noremap = true})

map('n', '<Leader>q', '<cmd>bdelete!<CR>', {silent = true, noremap = true})

-- LSP Keys
map('n', '<Leader>gd', '<cmd>lua require("nvim-treesitter-refactor.navigation").goto_definition_lsp_fallback(0)<CR>', {silent = true, noremap = true})
map('n', '<Leader>gc', '<cmd>TSTextobjectPeekDefinitionCode @function.outer<CR>', {silent = true, noremap = true})
map('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {silent = true, noremap = true})
map('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent = true, noremap = true})
map('n', '<Leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {silent = true, noremap = true})
map('n', '<Leader>gl', '<cmd>lua require("nvim-treesitter-refactor.navigation").list_definitions(0)<CR>', {silent = true, noremap = true})
map('n', '<Leader>gO', '<cmd>lua require("nvim-treesitter-refactor.navigation").list_definitions_toc(0)<CR>', {silent = true, noremap = true})
map('n', '<C-n>', '<cmd>lua vim.lsp.buf.goto_next()<CR>', {silent = true, noremap = true})
map('n', '<C-p>', '<cmd>lua vim.lsp.buf.goto_prev()<CR>', {silent = true, noremap = true})
map('n', '<C-d>', '<cmd>lua vim.lsp.buf.show_line_diagnostics()<CR>', {silent = true, noremap = true})

-- LSP Trouble Keys
map('n', '<leader>xx', '<cmd>LspTroubleToggle<CR>', {silent = true, noremap = true})
map('n', '<leader>xw', '<cmd>LspTroubleToggle lsp_workspace_diagnostics<CR>', {silent = true, noremap = true})
map('n', '<leader>xd', '<cmd>LspTroubleToggle lsp_document_diagnostics<CR>', {silent = true, noremap = true})
map('n', '<leader>xl', '<cmd>LspTroubleToggle loclist<CR>', {silent = true, noremap = true})
map('n', '<leader>xq', '<cmd>LspTroubleToggle quickfix<CR>', {silent = true, noremap = true})
map('n', '<Leader>gr', '<cmd>LspTrouble lsp_references<CR>', {silent = true, noremap = true})

-- TODO: Comments Keys
map('n', '<Leader>xt', '<cmd>TodoTrouble<CR>', { silent = true, noremap = true })

-- LSP Saga
map('n', '<leader>gh', '<cmd>Lspsaga hover_doc<CR>', {silent = true, noremap = true})
map('n', '<leader>sa', '<cmd>Lspsaga code_action<CR>', {silent = true, noremap = true})
map('n', '<leader>sr', '<cmd>Lspsaga rename<CR>', {silent = true, noremap = true})

-- Compe Keys
map('i', '<Tab>', 'v:lua.tab_complete()', {expr = true, noremap = true})
map('s', '<Tab>', 'v:lua.tab_complete()', {expr = true, noremap = true})
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true, noremap = true})
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true, noremap = true})
map('i', '<C-Space>', 'compe#complete()', {expr = true, noremap = true})
map('i', '<CR>', 'compe#confirm("<CR>")', {expr = true, noremap = true})

-- Telescope Keys
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').oldfiles()<CR>", { noremap = true })
map('n', '<Leader>fl', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", { noremap = true })
map('n', '<Leader>fGg', "<cmd>lua require('telescope.builtin').git_commits()<CR>", { noremap = true })
map('n', '<Leader>fGc', "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", { noremap = true })
map('n', '<Leader>fGb', "<cmd>lua require('telescope.builtin').git_branches()<CR>", { noremap = true })
map('n', '<Leader>fGs', "<cmd>lua require('telescope.builtin').git_status()<CR>", { noremap = true })

-- Nvim-tree
map('n', '<Leader><Tab>', '<cmd>NvimTreeToggle<CR>', { noremap = true })
map('n', '<Leader>nr', '<cmd>NvimTreeRefresh<CR>', { noremap = true })
map('n', '<Leader>nf', '<cmd>NvimTreeFindFile<CR>', { noremap = true })

-- Dap
map('n', '<Leader>tb', "<cmd>lua require('dap').toggle_breakpoint()<CR>", { noremap = true })
map('n', '<Leader>tB', "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap = true })
map('n', '<Leader>tc', ":DebugC ", { noremap = true })
map('n', '<Leader>tr', ":DebugRust ", { noremap = true })

-- Diffview
map('n', '<Leader>do', '<cmd>DiffviewOpen -uno<CR>', { noremap = true })
map('n', '<Leader>dq', '<cmd>DiffviewClose<CR>', { noremap = true })
map('n', '<Leader>dr', '<cmd>DiffviewRefresh<CR>', { noremap = true })

-- Neogit
map('n', '<Leader>G', '<cmd>Neogit<CR>', { noremap = true })

-- 42 Header
map('n', '<F2>', ':Stdheader<CR>', { noremap = true })
