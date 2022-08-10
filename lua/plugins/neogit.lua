local neogit = require("neogit")
local mappings = require("mappings")

neogit.setup({
	kind = "tab",
	signs = {
		section = { "", "" },
		item = { "", "" },
		hunk = { "", "" },
	},
	disable_insert_on_commit = false,
})

mappings.add({
	"<Leader>gg",
	neogit.open,
	description = "Open Neogit",
})