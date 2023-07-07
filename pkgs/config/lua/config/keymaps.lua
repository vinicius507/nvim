vim.g.mapleader = " "

local M = {}

-- Thanks to the primeagen for these gems
-- Better Cursor positioning in search
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Better cursor positioning while joining lines
vim.keymap.set("n", "J", "mzJ`z", { silent = true })

-- Undo breakpoints
vim.keymap.set("i", ",", ",<C-g>u", { silent = true })
vim.keymap.set("i", ".", ".<C-g>u", { silent = true })
vim.keymap.set("i", "!", "!<C-g>u", { silent = true })
vim.keymap.set("i", "?", "?<C-g>u", { silent = true })

-- Moving Text
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("i", "<C-j>", "<esc>:m .+1<CR>==a", { silent = true })
vim.keymap.set("i", "<C-k>", "<esc>:m .-2<CR>==a", { silent = true })

return M
