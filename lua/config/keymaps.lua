vim.g.mapleader = " "

local M = {}

-- Buffer mappings
vim.keymap.set("n", "<Leader>bk", vim.cmd.bdelete, { desc = "Kill buffer" })

-- Window mappings
vim.keymap.set("n", "<Leader>ws", vim.cmd.split, { desc = "Split window" })
vim.keymap.set("n", "<Leader>wv", vim.cmd.vsplit, { desc = "Split window vertically" })
vim.keymap.set("n", "<Leader>wq", vim.cmd.quit, { desc = "Close window" })

local directions = {
	j = "up",
	k = "down",
	h = "left",
	l = "right",
}
for key, direction in pairs(directions) do
	local goto_keys = string.format("<Leader>w%s", key)
	local goto_desc = string.format("Goto window %s", direction)
	local move_keys = string.format("<Leader>w%s", key:upper())
	local move_desc = string.format("Move window %s", direction)
	vim.keymap.set("n", goto_keys, function()
		vim.cmd.wincmd(key)
	end, { desc = goto_desc })
	vim.keymap.set("n", move_keys, function()
		vim.cmd.wincmd(key:upper())
	end, { desc = move_desc })
end

-- Better Cursor positioning in search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Better cursor positioning while joining lines
vim.keymap.set("n", "J", "mzJ`z")
-- Undo breakpoints
vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", "!", "!<C-g>u")
vim.keymap.set("i", "?", "?<C-g>u")
-- Moving Text
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-j>", "<esc>:m .+1<CR>==a")
vim.keymap.set("i", "<C-k>", "<esc>:m .-2<CR>==a")

return M
