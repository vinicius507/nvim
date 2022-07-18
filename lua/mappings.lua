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

mappings.add({
	"<Leader>bk",
	function()
		vim.api.nvim_buf_delete(0, {})
	end,
	description = "Kill Buffer",
})

return mappings
