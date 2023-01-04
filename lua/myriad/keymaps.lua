vim.g.mapleader = " "

local M = {}

---@alias MapModes
---| "n" Normal
---| "v" Visual and Select
---| "s" Select
---| "x" Visual
---| "o" Operator-pending
---| "m" Insert and Command-line
---| "i" Insert
---| "l" Insert, Command-line, Lang-Arg
---| "c" Command-line
---| "t" Terminal

---@class RemapOpts
---@field modes MapModes|MapModes[]|nil
---@field silent boolean|nil
---@field noremap boolean|nil
---@field expr boolean|nil
---@field buffer integer|nil
---@field nowait boolean|nil
---@field desc string|nil
local RemapOpts = {
	modes = "n",
	silent = true,
	noremap = true,
	expr = nil,
	buffer = nil,
	nowait = nil,
	desc = nil,
}

---@param keys string
---@param cb string|function
---@param opts RemapOpts?
function M.remap(keys, cb, opts)
	---@type RemapOpts
	opts = vim.tbl_extend("force", RemapOpts, opts or {})
	vim.validate({
		keys = { keys, "string" },
		cb = { cb, { "string", "function" } },
		modes = { opts.modes, { "string", "table" }, true },
		buffer = { opts.buffer, "number", true },
		expr = { opts.expr, "boolean", true },
		nowait = { opts.nowait, "boolean", true },
		silent = { opts.silent, "boolean", true },
		noremap = { opts.noremap, "boolean", true },
		desc = { opts.desc, "string", true },
	})

	vim.keymap.set(opts.modes, keys, cb, {
		buffer = opts.buffer,
		expr = opts.expr,
		nowait = opts.nowait,
		silent = opts.silent,
		noremap = opts.noremap,
		desc = opts.desc,
	})
end

-- Buffer mappings
M.remap("<Leader>bk", vim.cmd.bdelete, { desc = "Kill buffer" })

-- Window mappings
M.remap("<Leader>ws", vim.cmd.split, { desc = "Split window" })
M.remap("<Leader>wv", vim.cmd.vsplit, { desc = "Split window vertically" })
M.remap("<Leader>wq", vim.cmd.quit, { desc = "Close window" })

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
	M.remap(goto_keys, function()
		vim.cmd.wincmd(key)
	end, { desc = goto_desc })
	M.remap(move_keys, function()
		vim.cmd.wincmd(key:upper())
	end, { desc = move_desc })
end

-- Better Cursor positioning in search
M.remap("n", "nzzzv")
M.remap("N", "Nzzzv")
-- Better cursor positioning while joining lines
M.remap("J", "mzJ`z")
-- Undo breakpoints
M.remap(",", ",<C-g>u", { modes = "i" })
M.remap(".", ".<C-g>u", { modes = "i" })
M.remap("!", "!<C-g>u", { modes = "i" })
M.remap("?", "?<C-g>u", { modes = "i" })
-- Moving Text
M.remap(">", ">gv", { modes = "v" })
M.remap("<", "<gv", { modes = "v" })
M.remap("J", ":m '>+1<CR>gv=gv", { modes = "v" })
M.remap("K", ":m '<-2<CR>gv=gv", { modes = "v" })
M.remap("<C-j>", "<esc>:m .+1<CR>==a", { modes = "i" })
M.remap("<C-k>", "<esc>:m .-2<CR>==a", { modes = "i" })

return M
