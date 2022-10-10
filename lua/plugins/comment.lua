local api = require("Comment.api")

local mappings = require("mappings")

require("Comment").setup({
	padding = true,
	sticky = true,
	ignore = nil,
	mappings = false,
})

mappings.add({
	"gc",
	api.call("toggle.linewise", "g@"),
	expr = true,
	desc = "Comment region linewise",
})
mappings.add({
	"gcc",
	api.call("toggle.linewise.current", "g@$"),
	expr = true,
	description = "Comment current line",
})
mappings.add({
	"gcb",
	api.call("toggle.blockwise.current", "g@$"),
	expr = true,
	description = "Comment current block",
})

-- Visual
-- NOTE:Workaround for nvim_feedkeys
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

mappings.add({
	"gcc",
	function()
		vim.api.nvim_feedkeys(esc, "nx", false)
		api.locked("toggle.linewise")(vim.fn.visualmode())
	end,
	modes = "x",
	desc = "Comment region linewise (visual)",
})
