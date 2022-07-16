vim.g.mapleader = " "
local set_keymap = vim.api.nvim_set_keymap

local function add_mapping(mode, keys, cmd, opts)
	local options = vim.tbl_extend("force", {
		noremap = true,
		silent = true,
	}, opts or {})
	set_keymap(mode, keys, cmd, options)
end

local mapping = setmetatable({}, {
	__index = function(tbl, key)
		local modes = { normal = "n" }
		local map_mode = modes[key]
		if map_mode then
			return function(keys, cmd, opts)
				add_mapping(map_mode, keys, cmd, opts)
			end
		end
	end,
})

mapping.normal("<C-h>", "<CMD>wincmd h<CR>")
mapping.normal("<C-j>", "<CMD>wincmd j<CR>")
mapping.normal("<C-k>", "<CMD>wincmd k<CR>")
mapping.normal("<C-l>", "<CMD>wincmd l<CR>")

return mapping
