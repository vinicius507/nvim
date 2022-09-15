vim.g.mapleader = " "
local keymap = vim.keymap

local mappings = {}

function mappings.add(map)
	vim.validate({
		keys = { map[1], "string" },
		callback = { map[2], { "string", "function" } },
		modes = { map.modes, { "string", "table", "nil" } },
		buffer = { map.buffer, { "number", "nil" } },
		expr = { map.expr, { "boolean", "nil" } },
		nowait = { map.nowait, { "boolean", "nil" } },
		silent = { map.silent, { "boolean", "nil" } },
		noremap = { map.noremap, { "boolean", "nil" } },
		description = { map.description, { "string", "nil" } },
	})
	local keys = map[1]
	local callback = map[2]
	local modes = map.modes or "n"
	local opts = vim.tbl_extend("keep", {
		buffer = map.buffer,
		expr = map.expr,
		nowait = map.nowait,
		silent = map.silent,
		noremap = map.noremap,
		desc = map.description,
	}, { silent = true, noremap = true })
	keymap.set(modes, keys, callback, opts)
end

-- Windows
local directions = {
	j = "up",
	k = "down",
	h = "left",
	l = "right",
}
for key, direction in pairs(directions) do
	mappings.add({
		string.format("<Leader>w%s", key),
		string.format("<CMD>wincmd %s<CR>", key),
		description = string.format("Goto window %s", direction),
	})
	mappings.add({
		string.format("<Leader>w%s", key:upper()),
		string.format("<CMD>wincmd %s<CR>", key:upper()),
		description = string.format("Move window %s", direction),
	})
end
mappings.add({
	"<Leader>ws",
	"<CMD>split<CR>",
	description = "Split window",
})
mappings.add({
	"<Leader>wv",
	"<CMD>vsplit<CR>",
	description = "Split window vertically",
})

-- Files
mappings.add({
	"<Leader>fD",
	function()
		if vim.fn.confirm(string.format("Delete %s?", vim.fn.expand("%:t")), "&Yes\n&No", 1) == 1 then
			vim.fn.delete(vim.expand("%"), "f")
		end
	end,
	description = "Delete file",
})
mappings.add({
	"<Leader>fR",
	function()
		local filename = vim.fn.expand("%")
		local new_filename = vim.fn.input("New filename: ", vim.fn.expand("%"), "file")
		if new_filename == "" then
			return
		end
		if vim.fn.confirm(string.format("%s  %s", filename, new_filename), "&Yes\n&No", 1) == 1 then
			vim.fn.rename(filename, new_filename)
		end
	end,
	description = "Rename file",
})

-- Hacks by ThePrimeagen
-- Better Cursor positioning in search
mappings.add({ "n", "nzzzv" })
mappings.add({ "N", "Nzzzv" })
-- Better cursor positioning while joining lines
mappings.add({ "J", "mzJ`z" })
-- Undo breakpoints
mappings.add({ ",", ",<C-g>u", modes = "i" })
mappings.add({ ".", ".<C-g>u", modes = "i" })
mappings.add({ "!", "!<C-g>u", modes = "i" })
mappings.add({ "?", "?<C-g>u", modes = "i" })
-- Moving Text
mappings.add({ ">", ">gv", modes = "v" })
mappings.add({ "<", "<gv", modes = "v" })
mappings.add({ "J", ":m '>+1<CR>gv=gv", modes = "v" })
mappings.add({ "K", ":m '<-2<CR>gv=gv", modes = "v" })
mappings.add({ "<C-j>", "<esc>:m .+1<CR>==a", modes = "i" })
mappings.add({ "<C-k>", "<esc>:m .-2<CR>==a", modes = "i" })

return mappings
