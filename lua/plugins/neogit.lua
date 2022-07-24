local neogit = require("neogit")
local mappings = require("mappings")

neogit.setup({
	kind = "tab",
	signs = {
		section = { "", "" },
		item = { "", "" },
		hunk = { "", "" },
	},
})

mappings.add({
	"<Leader>gg",
	neogit.open,
	description = "Open Neogit",
})
