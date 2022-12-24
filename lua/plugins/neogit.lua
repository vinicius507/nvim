local neogit = require("neogit")
local mappings = require("mappings")

neogit.setup({
	kind = "floating",
	commit_popup = { kind = "floating" },
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
mappings.add({
	"<Leader>gc",
	function()
		neogit.open({ "commit" })
	end,
	description = "Commit",
})
