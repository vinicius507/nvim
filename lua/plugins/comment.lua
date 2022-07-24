local mappings = require("mappings")

require("Comment").setup({
	padding = true,
	sticky = true,
	ignore = nil,
	mappings = false,
})

mappings.add({
	"gcc",
	"v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'",
	description = "Toggle",
	expr = true,
	noremap = false,
})
mappings.add({
	"gbc",
	"v:count == 0 ? '<Plug>(comment_toggle_current_blockwise)' : '<Plug>(comment_toggle_blockwise_count)'",
	description = "Toggle",
	expr = true,
	noremap = false,
})
mappings.add({ "gc", "<Plug>(comment_toggle_linewise)", description = "Comment linewise" })
mappings.add({ "gb", "<Plug>(comment_toggle_blockwise)", description = "Comment blockwise" })
mappings.add({ "gc", "<Plug>(comment_toggle_linewise_visual)", modes = "x", description = "Comment linewise" })
mappings.add({ "gb", "<Plug>(comment_toggle_blockwise_visual)", modes = "x", description = "Comment linewise visual" })
