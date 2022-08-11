local mappings = require("mappings")
local gitsigns = require("gitsigns")

gitsigns.setup({
	current_line_blame = true,
})

mappings.add({
	"<Leader>gs",
	gitsigns.stage_hunk,
	modes = { "n", "v" },
	description = "Stage hunk",
})
mappings.add({
	"<Leader>gS",
	gitsigns.stage_buffer,
	description = "Stage buffer",
})
mappings.add({
	"<Leader>gu",
	gitsigns.undo_stage_hunk,
	description = "Undo hunk",
})
mappings.add({
	"<Leader>gr",
	gitsigns.reset_hunk,
	modes = { "n", "v" },
	description = "Reset hunk",
})
mappings.add({
	"<Leader>gR",
	gitsigns.reset_buffer,
	description = "Reset buffer",
})
mappings.add({
	"<Leader>gp",
	gitsigns.preview_hunk,
	description = "Preview hunk",
})
mappings.add({
	"<Leader>gb",
	function()
		gitsigns.blame_line({ full = true })
	end,
	description = "Blame line",
})
mappings.add({
	"<Leader>gtb",
	gitsigns.toggle_current_line_blame,
	description = "Current line blame",
})
mappings.add({
	"<Leader>gtd",
	gitsigns.toggle_deleted,
	description = "Deleted",
})
mappings.add({
	"<Leader>gd",
	gitsigns.diffthis,
	description = "Diff hunk",
})
mappings.add({
	"<Leader>gD",
	function()
		gitsigns.diffthis("~")
	end,
	description = "Diff File",
})
